% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

% Parâmetros dos sinais
freq = 50;           % Frequência (Hz)
sampling_freq = 300;  % Frequência de amostragem (Hz)
A = 1;              % Amplitude

% Parâmetros da Animação
periods = 10;                        % Quantidade de perídos da onda a serem exibidos
num_points = 100 * periods;         % Quantidades de pontos total da senóide
duration = (1/freq) * periods;      % Cálculo do tempo total de execução
sampling_T = 1/sampling_freq;

% Gerando pontos da circunferência no plano (x, y)
plot_circle = subplot(3,2,1);
ct = linspace(0, 2*pi);
cx = cos(ct)*A ;
X = sin(ct)*A;

% Plotando circunferência contínua
line(cx, X, 'LineWidth',2);
%axis([0 duration -A A]);
grid on, box on, axis equal;
axis([-A A -A A])
title('Vetor gerador da senóide');
xlabel(strcat(num2str(A),'cos(2\pi *', num2str(freq), 't)'));
ylabel(strcat(num2str(A),'sin(2\pi *', num2str(freq), 't)'));
vector = line(ones(1,2), ones(1,2), 'LineWidth',1);

% Preparando senóide
plot_senoid = subplot(3,2,2);
grid on, box on;
axis([0 duration -A A]);
senoidAnimation = animatedline('Color',vector.Color, 'LineWidth',2);
xlabel('Tempo (s)');
ylabel(strcat(num2str(A),'cos(2\pi *', num2str(freq), 't)'))
%legend(senoidAnimation, strcat(num2str(A),'sin(', num2str(freq), '\theta)'), 'Location','SouthOutside');
title('Sinal contínuo');

% Plotando circunferência de amostragem
plot_circle_sampling = subplot(3,2,3);
axis([-A A -A A]);
line(cx, X, 'LineWidth',2);
grid on, box on, axis equal;
title('Amostragem');
xlabel(strcat(num2str(A),'cos(2\pi *', num2str(freq), 't)'));
ylabel(strcat(num2str(A),'sin(2\pi *', num2str(freq), 't)'));
vector_sampling = line([0 0], [0 A], 'LineWidth',1);

linkaxes([plot_circle_sampling, plot_circle], 'xy');

% Plotando amostras
plot_samples = subplot(3,2,4);
samples = stem(nan,nan);
grid on, box on;
title('Sinal amostrado');
xlabel('Tempo (s)');
ylabel(strcat(num2str(A),'cos(2\pi *', num2str(sampling_freq), 't)'));
axis([0 duration -A A]);

% Espectros
plot_fft = subplot(3,2,5);
% Propriedades do sinal amostrado
num_samples = floor(duration/sampling_T);
T_sample = duration/num_samples;
x_samples = nan(num_samples, 1);
y_samples = nan(num_samples, 1);
% Cálculo do espectro do sinal amostrado
st = 0:T_sample:duration;
sampled_signal = A*cos(2*pi*freq*st);
X = fftshift(fft(sampled_signal));
freq_step = sampling_freq/num_samples;
f = -sampling_freq/2:freq_step:sampling_freq/2-freq_step;
% Plotagem do gráfico dos espectros
plot(f, abs(X(1:end-1))/num_samples);  
grid on, box on;
title('Espectro do sinal amostrado');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');

% Loop initial conditions
buildingSenoid = true;
next_sample = 0;
n = 1;

while true
    for ct=0:duration/num_points:duration
        if ~isgraphics(hFig), return; end % Encerra se a figura foi fechada
        
        % Atualiza coordenadas (x,y) -- sin e cos estão trocados p/
        % inverter o sentido
        x = A*sin(2*pi*freq*ct);
        y = A*cos(2*pi*freq*ct);

        if(buildingSenoid)
            addpoints(senoidAnimation, ct, y);
            if(ct >= st(n))
                set(samples,'XData', st(1:n), 'YData',sampled_signal(1:n));
                set(vector_sampling, 'XData',[0; x], 'YData',[0; y]);
                n = n + 1;
            end  
        end
        set(vector, 'XData',[0; x], 'YData',[0; y]);        % Desenha vetor girante
        
        % Refresh nos gráficos
        drawnow;
    end
    buildingSenoid = false;
    pause(1);
end
