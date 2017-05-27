function display_matches(track_begin_end_formants, row_track, giant_matrix, output_matrix, y)

disp('The program has finished analyzing your input signal.')
disp(' ')
disp('It has determined the following information about the words you said.')

% The following displays information as text output to the user.
% It also keeps track of the # counts of each vowel identified.

vowel_count = zeros(6, 1);

disp('According to the frequency spectrum of your input signal:')


for k = 1:row_track-1
        t1 = track_begin_end_formants(k, 1);
        t2 = track_begin_end_formants(k, 2);
        formants = track_begin_end_formants(k, 3:4);
        %find index of row in giant_matrix with formants
        index = find(ismember(giant_matrix, [formants], 'rows'));
        
        vowel_count(index, 1) = vowel_count(index, 1) + 1;
     
        disp(['...the vowel you said at roughly time t1 = ' num2str(t1-2*4000/44100.0) ' seconds ']) 
        disp(['to time t2 = ' num2str(t2) ' is the central vowel of the word ' output_matrix(index,:)]);
        disp(' ')
        
end



% The following generates a graph indicating location of identified vowels
% in the signal.

figure 

plot_vector = zeros(length(y), 1);

for k = 1:row_track-1
        t_start = floor(44100*(track_begin_end_formants(k, 1) -2*4000/44100.0));
        t_end = floor(44100*(track_begin_end_formants(k, 2)));
        plot_vector(t_start:t_end-1) = wgn(t_end-t_start, 1 ,10);
        
end

subplot(2, 1, 1)
plot(1:length(y),y)
axis([0 length(y) -1 1])
title('Señal original')
xlabel('Periodo: (1/Fs)') % x-axis label
ylabel('Señal de voz') % y-axis label

subplot(2, 1, 2)
plot(plot_vector)
axis([0 length(y) -1 1])
%title('Approximate location of vowel sounds.')
title('Ubicación del sondido de la vocal')
xlabel('Periodo: (1/Fs)') % x-axis label
ylabel('Ruido para indicar la posición de la vocal') % y-axis label



% The following generates a count of what words were said.
figure 

bar(vowel_count);
set(gca, 'XTickLabel', {'see', 'play', 'hat', 'palm', 'rug', 'head'});
ylabel('Total de apariciones por palabra');

end