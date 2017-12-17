[x,fs] = audioread('SinalRuidoso.wav');
xSound = audioplayer(x,fs);
xSound.play;
pause(8);

N = length(x);

df = fs / N;
w = (-(N/2):(N/2)-1)*df;
y = fft(x, N) / N; 
y2 = fftshift(y);
figure;
plot(w,abs(y2));

cutoff = 2500/(fs/2);
[b,a] = butter(10, cutoff);

x_filtered = filter(b, a, x);
p = audioplayer(x_filtered,fs);
p.play;