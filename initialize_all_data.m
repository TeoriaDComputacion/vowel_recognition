function [giant_matrix, output_matrix, recent_formant_pairs, track_times_and_formants, track_counter] = initialize_all_data()

    % from wikipedia
    see	= [ 240	2400];
    play	= [390	2300];
    hat =    [850	1610];
    palm	= [750	940];
    rug	= [600	1170];
    %thought =	[500	700];
    % from http://www.sfu.ca/sonic-studio/handbook/Formant.html
    %who = [340 910];
    head = [550 1880];  

    giant_matrix = [see; play; hat; palm; rug; head];
    output_matrix = vertcat(double('"see"    '), double('"play"   '), double('"hat"    '), double('"palm"   '), double('"rug"    '), double('"head"   '));
    recent_formant_pairs = ones(3, 2) ;

    track_times_and_formants = ones(100,3);
    track_counter = 1;

end