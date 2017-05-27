function [y, Fs] = readLiveAudio(n)
%This section of code allows the user to say a vowel for 5 seconds.
%Uses the stream from the microphone to generate an array representing
%the sound data.
recObj = audiorecorder(44100,8,1);
disp('Habla ahora por favor.')
recordblocking(recObj, n);
disp('Fin de la grabación.');
y = getaudiodata(recObj);
Fs = 44100;

   
%Signal preprocessing: detrend the signal with a low order polynomial. 
%Polynomials are locally linear, which means they are optimal for
%detrending large sets of data chunks at a time.

%trend_y_poly = polyfit((1:numel(y))', y, 6);
%trend_of_y = polyval(trend_y_poly, y);
%y = y - trend_of_y;
%num = 1;

%More preprocessing. Get rid of high frequency spikes because they're
%probably due to irrelevant information (noise, consonants, fricatives,
%etc). 0.14*pi digital angular frequency corresponds to a frequency of 2875 Hz.

[b,a] = butter(3,0.13);
y = filter(b,a,y);

end