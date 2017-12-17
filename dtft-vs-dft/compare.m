T=4; % Tamanho do pulso retangular
t=-10:1:13; % Instante de tempo considerado
x=rectpuls(t-T/2,T); % Geração do pulso

subplot(2,2,1);
stem(t, x);
ylim([0 2])
title('Sinal');
xlabel('n');
ylabel('x[n]')
% Cálculo da DFT
N=20000; % N >> n p/ aproximar da DFT da DTFT
X_dft= dft(x, N);


subplot(2,2,3);
omega = linspace(-2*pi, 2*pi, 2*N);
X_dtft = [conj(X_dft) X_dft];
plot(omega,abs(X_dtft));
title('DTFT de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');

subplot(2,2,4);
arg_dtft = angle(X_dtft);
plot(omega, arg_dtft);
%title('Fase do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');

input('Pressione uma tecla para visualizar os próximos...');

subplot(2,2,1);
omega = linspace(0, 2*pi, N);
plot(omega,abs(X_dft));
title('DTFT de 0 até 2\pi');
xlim([0 2*pi])
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');

subplot(2,2,2);
arg_dtft = angle(X_dft);
plot(omega, arg_dtft);
xlim([0 2*pi])
%title('Fase do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');

% DFT 4 pontos
subplot(2,2,3)
N = 4;
X_dft= dft(x, N);
stem(abs(X_dft));
title('DFT de 4 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(2,2,4)
stem(angle(X_dft));
xlabel('K');
ylabel('arg(X[k])');

input('Pressione uma tecla para visualizar os próximos...');

%DFT 8
subplot(2,2,3)
N = 8;
X_dft= dft(x, N);
stem(abs(X_dft));
title('DFT de 8 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(2,2,4)
stem(angle(X_dft));
xlabel('K');
ylabel('arg(X[k])');

input('Pressione uma tecla para visualizar os próximos...');

%DFT 16
subplot(2,2,3)
N = 16;
X_dft= dft(x, N);
stem(abs(X_dft));
title('DFT de 16 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(2,2,4)
stem(angle(X_dft));
xlabel('K');
ylabel('arg(X[k])');

input('Pressione uma tecla para visualizar os próximos...');

%DFT 128
subplot(2,2,3)
N = 300;
X_dft= dft(x, N);
stem(abs(X_dft));
title('DFT de 128 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(2,2,4)
stem(angle(X_dft));
xlabel('K');
ylabel('arg(X[k])');

