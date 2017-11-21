% Parâmetros para a gravação do áudio
fs = 8000; %Hz
nBits = 24; % Quantidade de bits por amostra
nChannels = 1; %Quantidade de canais (mono ou estéreo)
duration = 5; %Seconds

%Gravação e demonstração do áudio gravado
disp(['Gravando áudio por ', num2str(duration), ' segundos... ']);
recorder = audiorecorder(fs, nBits, nChannels); %Objeto para gravação
recordblocking(recorder, duration); %Efetuando gravação
x = getaudiodata(recorder); %Valores do sinal gravado
disp("Tocando áudio gravado...");
sound(x, fs);
pause(duration);

%Processamento do Sinal
fshift = 255; % Frequência pela qual o sinal será deslocado
NFFT = length(x);
shiftIndex = (NFFT*fshift)/fs; %Cálculo do índice da frequência de deslocamento
shiftIndex = mod(shiftIndex, NFFT); %Propriedade do Deslocamento Circular
X = fft(x, NFFT);
F = ((0:1/NFFT:1-1/NFFT)*fs)'; % Frequências de cada ponto da FFT
X = fftshift(X); %Centralizando o componente DC no centro do espectro
X_shifted = [X((shiftIndex+1):end);      X(1:shiftIndex)]; %Realizando operação de deslocamento
x_shifted = ifft(ifftshift(X_shifted),NFFT); %Colocando o sinal de volta no domínio do tempo


%Tocando o sinal distorcido
sound(real(x_shifted), fs);
pause(duration);

%Espectro do sinal original e do sinal deslocado
subplot(2,1,1);
plot(F, abs(X)/NFFT);
title('Espectro do sinal original');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');

subplot(2,1,2);
plot(F, abs(X_shifted)/NFFT);
title('Espectro do sinal deslocado');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');

