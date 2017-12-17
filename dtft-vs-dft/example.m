T=4; %width of the rectangule pulse in seconds
t=0:1:3; %time base
x=rectpuls(t-T/2,T); %generating the square wave
stem(t,x);
X = fft(x, 4);
subplot(1,2,1)
stem(abs(X));
subplot(1,2,2);
stem(phase(X));
