function [track_begin_end_formants, row_track] = cleanup_formant_data(track_times_and_formants)

track_begin_end_formants = ones(100, 4);
row_track = 1;
k = 1;
while (k < 100)    
    time = track_times_and_formants(k, 1);
    current_formant_vals = track_times_and_formants(k,2:3);  
    last_previous_value = time;
    future_time = time;
    while (track_times_and_formants(k+1,1) - future_time < 0.15) && (track_times_and_formants(k+1,1) - future_time ~= 0)
       last_previous_value = future_time;
       future_time = track_times_and_formants(k+1,1);
       k = k+1;
    end
    if  (isequal(current_formant_vals, [1 1]) == 0)
        track_begin_end_formants(row_track, :) = [time last_previous_value current_formant_vals];
        row_track = row_track + 1;    
    end
    k=k+1;
end

end