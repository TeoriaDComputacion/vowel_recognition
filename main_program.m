

disp('Instrucciones: Menciona cualquier combinación de palabras unisílabas [see, hat, play, head, palm, rug]')
disp('Ingresa el numero de segundos de grabación')
disp(' ')

n = input('');

[y, Fs] = readLiveAudio(n);

disp(' ');
%disp('To be able to verify the functionality of the program for posterity, we would')
%disp('like to store the speech signal you provided. It will save your speech ')
%disp('signal to a corresponding .mat file in the program root folder. ')


disp(' ')

disp('por favor ingresa las palabras enunciandas durante la grabación, en orden cronologico')
disp('separadas por un caracter "_" ')
disp('Ej: hat_see_hat_play')
disp('La grabación será almacenada en el directorio como hat_see_hat_play.m')
disp(' ')
n = input('', 's');
disp(' ')
disp('Por favor ingresa tu nombre.');
name = input('', 's');
disp(' ')
disp('Ingresa el numero de palabras ingresadas.')
num = input('');
disp(' ')
disp('Cuantas veces se ha ejecutado el código para el numero de palabras ingresado?')

trial = input('') + 1;

current_folder = pwd;

string_dir = strcat('C:/Users/Miguel/Downloads/Elec301Spectrogram/Data/', name, '/', '', num2str(num), 'words', '/', 'Trial',  num2str(trial));

options = struct('format','pdf', 'outputDir', string_dir);
publish('Elec301spectrogram_livefile.m', options);

cd(string_dir);
save(n);
cd('C:/Users/Miguel/Downloads/Elec301Spectrogram/');

%disp('Your results have been stored in a folder matching your information in the data directory.') 
%disp('Thank you for testing this vowel recognition program!')
disp('La información ha sido guaradada en el directorio por defecto')

