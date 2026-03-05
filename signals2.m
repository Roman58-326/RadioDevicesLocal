A = 1; % Амплитуда сигнала
Fs = 10e4; % Частота дискретизации
t = 0.1;
t_array = 0:1/Fs:t;
points = 1:1:length(t_array);
tones = 10; % Количество тонов
f1 = input('Задайте нижнюю границу диапазона частот: ');
f2 = input('Задайте верхнюю границу диапазона частот: ');
df=(f2-f1)/tones;10 % Шаг частоты
S = zeros(tones, length(t_array)); % Двумерный массив сигналов
S_fft = zeros(tones, length(t_array));
S_fft_shifted = zeros(tones, length(t_array));
S_fft_mod = zeros(tones, length(t_array)); % Двумерный массив амплитуд спектров
S_fft_ang = zeros(tones, length(t_array));
S_fft_mod_db = zeros(tones, length(t_array)); % Двумерный массив магнитуд спектров (в децибелах)
for k = 1:tones
   S(k, :) = A*exp(2*pi*t_array*1i*k*df);
   S_fft(k, :) = fft(S(k, :));
   S_fft_shifted(k, :) = fftshift(S_fft(k, :));
   S_fft_mod(k, :) = abs(S_fft_shifted(k, :)/length(S_fft_shifted(k, :)));
   S_fft_ang(k, :) = atan(S_fft_shifted(k, :));
   S_fft_mod_db(k, :) = 20*log10(S_fft_mod(k, :)/A); % Перевод магнитуды спектра в децибелы
  end;
 figure(1);
 plot(points, S_fft_mod(1,:), points, S_fft_mod(2,:), points, S_fft_mod(3,:), points, S_fft_mod(4,:), points, S_fft_mod(5,:), points, S_fft_mod(6,:), points, S_fft_mod(7,:), points, S_fft_mod(8,:), points, S_fft_mod(9,:), points, S_fft_mod(10,:));
 title('Спектр сигнала');

 figure(2);
 plot(points, S_fft_mod_db(1,:), points, S_fft_mod_db(2,:), points, S_fft_mod_db(3,:), points, S_fft_mod_db(4,:), points, S_fft_mod_db(5,:), points, S_fft_mod_db(6,:), points, S_fft_mod_db(7,:), points, S_fft_mod_db(8,:), points, S_fft_mod_db(9,:), points, S_fft_mod_db(10,:));
 title('Амплитуда в дБ');
