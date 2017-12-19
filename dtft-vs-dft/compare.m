T=4; % Tamanho do pulso retangular
t=0:1:3; % Instante de tempo considerado
x=rectpuls(t-T/2,T); % Geração do pulso

subplot(3,2,1);
stem(t, x, 'filled');
ylim([0 2])
title('Sinal');
xlabel('n');
ylabel('x[n]')
% Cálculo da DFT
N=200000; % N >> n p/ aproximar da DFT da DTFT
X_dft= dft(x, N);
def_X_dft = X_dft;
def_omega = linspace(0, 2*pi, N);


subplot(3,2,3);
omega = linspace(-2*pi, 2*pi, 2*N);
X_dtft = [conj(X_dft) X_dft];
plot(omega,abs(X_dtft));
xlim([-2*pi 2*pi]);
title('DTFT de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');

subplot(3,2,4);
arg_dtft = angle(X_dtft);
plot(omega, arg_dtft);
xlim([-2*pi 2*pi]);
%title('Fase do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');

input('Pressione uma tecla para visualizar os próximos...');

subplot(3,2,1);
omega = linspace(0, 2*pi, N);
plot(omega,abs(X_dft));
title('DTFT de 0 até 2\pi');
xlim([0 2*pi])
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');

subplot(3,2,2);
arg_dtft = angle(X_dft);
plot(omega, arg_dtft);
xlim([0 2*pi])
%title('Fase do sinal de -2\pi até 2\pi');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');

%%%%%%%%%% DFT 4 pontos %%%%%%%
subplot(3,2,3)
N = 4;
k = 0:1:N-1;
X_dft= dft(x, N);
stem(k, abs(X_dft), 'filled');
title('DFT de 4 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(3,2,4)
stem(k, angle(X_dft), 'filled');
ylim([-5 5]);
xlabel('K');
ylabel('arg(X[k])');

subplot(3,2,5)
omega = (2*pi/N) * k;
hold on;
title('Demonstração da amostragem')
plot(def_omega, abs(def_X_dft))
xlim([0 2*pi])
stem(omega, abs(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');
hold off;

subplot(3,2,6)
hold on;
plot(def_omega, angle(def_X_dft))
xlim([0 2*pi])
stem(omega, angle(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');
hold off;

input('Pressione uma tecla para visualizar os próximos...');

%%%%%%%%%%%% DFT 8 %%%%%%%%%%%%%
subplot(3,2,3)
N = 8;
k = 0:1:N-1;
omega = (2*pi/N) * k;
X_dft= dft(x, N);
stem(k, abs(X_dft), 'filled');
title('DFT de 8 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(3,2,4)
stem(k, angle(X_dft), 'filled');
xlabel('K');
ylabel('arg(X[k])');

subplot(3,2,5)
hold on;
title('Demonstração da amostragem')
plot(def_omega, abs(def_X_dft))
xlim([0 2*pi])
stem(omega, abs(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');
hold off;

subplot(3,2,6)
hold on;
plot(def_omega, angle(def_X_dft))
xlim([0 2*pi])
stem(omega, angle(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');
hold off;

input('Pressione uma tecla para visualizar os próximos...');

%%%%%%%%%%%% DFT 16 %%%%%%%%%%%%%%%%%
subplot(3,2,3)
N = 16;
k = 0:1:N-1;
omega = (2*pi/N) * k;
X_dft= dft(x, N);
stem(k, abs(X_dft), 'filled');
title('DFT de 16 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(3,2,4)
stem(k, angle(X_dft), 'filled');
xlabel('K');
ylabel('arg(X[k])');

subplot(3,2,5)
hold on;
title('Demonstração da amostragem')
plot(def_omega, abs(def_X_dft))
xlim([0 2*pi])
stem(omega, abs(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');
hold off;

subplot(3,2,6)
hold on;
omega = (2*pi/N) * k;
plot(def_omega, angle(def_X_dft))
xlim([0 2*pi])
stem(omega, angle(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');
hold off;

input('Pressione uma tecla para visualizar os próximos...');

%%%%%%%%% DFT 128 %%%%%%%%
subplot(3,2,3)
N = 128;
k = 0:1:N-1;
omega = (2*pi/N) * k;
X_dft= dft(x, N);
stem(k, abs(X_dft), 'filled');
title('DFT de 128 Pontos');
xlabel('K');
ylabel('|X[k]|');

subplot(3,2,4)
stem(k, angle(X_dft), 'filled');
xlabel('K');
ylabel('arg(X[k])');

subplot(3,2,5)
hold on;
omega = (2*pi/N) * k;
title('Demonstração da amostragem')
plot(def_omega, abs(def_X_dft))
xlim([0 2*pi])
stem(omega, abs(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('|X(e^{j\Omega})|');
hold off;

subplot(3,2,6)
hold on;
plot(def_omega, angle(def_X_dft))
xlim([0 2*pi])
stem(omega, angle(X_dft), 'filled');
xlabel('\Omega (rad)');
ylabel('arg(X(e^{j\Omega})');
hold off;


