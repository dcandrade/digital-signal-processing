T=4; % Tamanho do pulso retangular
t=-10:1:13; % Instante de tempo considerado
x=rectpuls(t-T/2,T); % Geração do pulso

subplot(3,2,1);
stem(t, x);
title('Sinal');
xlabel('n');
ylabel('x[n]')
% Cálculo da DFT
N=20000; % N >> n p/ aproximar da DFT da DTFT
X_dft= dft(x, N);


subplot(3,2,3);
omega = linspace(-2*pi, 2*pi, 2*N);
X_dtft = [conj(X_dft) X_dft];
plot(omega,abs(X_dtft));
title('Magnitude do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');

subplot(3,2,4);
arg_dtft = angle(X_dtft);
plot(omega, arg_dtft);
title('Fase do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');