close all;

ordem = 101;
fc = 3250;
[data, Fs] = audioread('SinalRuidoso.wav');

wc = 2*pi*fc/Fs;

L = length(data);
y = fft(data);
P2 = abs(y/L);
P1 = P2(1:L/2+1);
f = Fs*(0:(L/2))/L;

filtro = desiredFilter(ordem, wc);
figure
plot(filtro)

janela = zeros(1, (ordem+1));

for i = 1 : (ordem+1)
    janela(i) = 1;
end

w_hamm = blackman(ordem+1)';

figure
plot(janela)

filtro = filtro.*w_hamm;
figure
plot(filtro)


audioFiltrado = conv(data, filtro);


player = audioplayer(audioFiltrado, Fs);

play(player)







%plot(f, P1);







