function [h,w, isNoise] = determine_frequency_response (y, t, Fs)
    
   signal_at_t = y(t:t+4000);

   % numerator doesn't actually matter, because looking for RELATIVE maxima.
   % changing the value of the 0th-order numerator doesn't affect shape of transfer function
   
   
   %Signal preprocessing: detrend the signal with a low order polynomial. 
   %Polynomials are locally linear, which means they are optimal for
   %detrending large sets of data chunks at a time.
   
   trend_t_poly = polyfit((1:numel(signal_at_t))', signal_at_t, 6);
   trend_at_t = polyval(trend_t_poly, signal_at_t);
   signal_at_t = signal_at_t - trend_at_t;
   num = 1;
   
   autoregr_model = ar(signal_at_t, 80);
   denom = polydata(autoregr_model);
      
   % calculates the z-transform values between 0 and pi. 
   % h(i) represents value of transfer function at angular frequency w(i)
   % frequency vector between 0 and pi stored in w.
   [h,w] = freqz(num, denom, Fs);

   
   %would like at least 1/8th of the signal to be at relevant amplitude in
   %order to consider it
      
   if (max(signal_at_t) >= 0.1*max(abs(y)) && mean(abs(signal_at_t)) > mean(abs(y)))
       isNoise = 0;
   else
       isNoise = 1;
   end
 
end