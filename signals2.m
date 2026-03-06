A = 1; % Амплитуда сигнала
Fs = 10e4; % Частота дискретизации
t = 0.1;
t_array = 0:1/Fs:t;
points = 1:1:length(t_array);
tones = 10; % Количество тонов
f1 = input('Задайте нижнюю границу диапазона частот: ');
f2 = input('Задайте верхнюю границу диапазона частот: ');
df=(f2-f1)/tones; % Шаг частоты
S = zeros(1,length(t_array)); % Массив сигнала
S_fft = zeros(1,length(t_array));
S_fft_shifted = zeros(1,length(t_array));
S_fft_mod = zeros(1,length(t_array)); % Массив амплитуд спектров
S_fft_ang = zeros(1,length(t_array));
for k = 1:tones
   St = A*exp(2*pi*t_array*1i*k*df);
   S = S + St;
   St_fft = fft(St);
   S_fft = S_fft + St_fft;
   St_fft_shifted = fftshift(St_fft);
   S_fft_shifted = S_fft_shifted + St_fft_shifted;
   St_fft_mod = abs(St_fft_shifted/length(St_fft_shifted));
   S_fft_mod = S_fft_mod + St_fft_mod;
   St_fft_ang = atan(St_fft_shifted);
   S_fft_ang = S_fft_ang + St_fft_ang;
   k = k + 1;
  end;
  S_fft_mod_db = 20*log10(S_fft_mod/A); % Перевод магнитуды спектра в децибелы
  figure(1);
  plot(S);

  figure(2);
  plot(S_fft);

  figure(3);
  plot(S_fft_mod);

  figure(4);
  plot(S_fft_mod_db);




