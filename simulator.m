% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

% Parâmetros dos sinais
freq = 5;           % Frequência (Hz)
sampling_freq = 6;  % Frequência de amostragem (Hz)
A = 4;              % Amplitude

% Parâmetros da Animação
periods = 10;                        % Quantidade de perídos da onda a serem exibidos
num_points = 100 * periods;         % Quantidades de pontos total da senóide
duration = (1/freq) * periods;      % Cálculo do tempo total de execução
sampling_T = 1/sampling_freq;

% Gerando pontos da circunferência no plano (x, y)
plot_circle = subplot(2,2,1);
t = linspace(0, 2*pi);
X = cos(t)*A ;
Y = sin(t)*A;

% Plotando circunferência contínua
line(X, Y, 'LineWidth',2);
%axis([0 duration -A A]);
grid on, box on, axis equal;
axis([-A A -A A])
xlabel('Vetor gerador da senóide');
vector = line(ones(1,2), ones(1,2), 'LineWidth',1);

% Preparando senóide
plot_senoid = subplot(2,2,2);
grid on, box on;
axis([0 duration -A A]);
senoidAnimation = animatedline('Color',vector.Color, 'LineWidth',2);
%legend(senoidAnimation, strcat(num2str(A),'sin(', num2str(freq), '\theta)'), 'Location','SouthOutside');
xlabel('Sinal contínuo');

% Plotando circunferência de amostragem
plot_circle_sampling = subplot(2,2,3);
axis([-A A -A A]);
line(X, Y, 'LineWidth',2);
grid on, box on, axis equal;
xlabel('Amostragem segundo o vetor');
vector_sampling = line([0 0], [0 A], 'LineWidth',1);

linkaxes([plot_circle_sampling, plot_circle], 'xy');

% Plotando amostras
plot_samples = subplot(2,2,4);
samples = stem(nan,nan);
grid on, box on;
xlabel('Sinal amostrado');
axis([0 duration -A A]);

buildingSenoid = true;
num_samples = ceil(duration/sampling_T);
T_sample = duration/num_samples;
x_samples = nan(num_samples, 1);
y_samples = nan(num_samples, 1);
next_sample = 0;
n = 1;

while true
    for t=0:duration/num_points:duration
        if ~isgraphics(hFig), return; end % Encerra se a figura foi fechada
        
        % Atualiza coordenadas (x,y) -- sin e cos estão trocados p/
        % inverter o sentido
        x = A*sin(2*pi*freq*t);
        y = A*cos(2*pi*freq*t);

        if(buildingSenoid)
            addpoints(senoidAnimation, t, y);
            if(t >= next_sample)
                x_samples(n) = next_sample;
                y_samples(n) = A*cos(2*pi*freq*next_sample);
                next_sample = next_sample + T_sample;
                
                set(samples,'XData', x_samples, 'YData',y_samples);
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
