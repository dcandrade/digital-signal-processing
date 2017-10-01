% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

% Parâmetros da senoide
freq = 1;           % Frequência (Hz)
A = 4;              % Amplitude

% Parâmetros da Animação
periods = 10;                       % Quantidade de perídos da onda a serem exibidos
num_points = 100;                   % Quantidades de pontos total da senóide
time_periods = (1/freq) * periods;  % Cálculo do tempo total de execução

% Gerando pontos da circunferência no plano (x, y)
plot_circle = subplot(1,2,1);
t = linspace(0, 2*pi);
X = cos(t)*A ;
Y = sin(t)*A;

% Plotando circunferência
line(X, Y, 'LineWidth',2);
grid on, box on, axis equal;
xlabel('Vetor gerador da senóide');

% Preparando objetos animados
vector = line(ones(1,2), ones(1,2), 'LineWidth',1);
plot_senoid = subplot(1,2,2);
grid on, box on;
axis([0 time_periods+1 -A A])

% Preparando senoide
senoidAnimation = animatedline('Color',vector.Color, 'LineWidth',2);
legend(senoidAnimation, strcat(num2str(A),'sin(', num2str(freq), '\theta)'), 'Location','EastOutside');

buildingSenoid = true;

while true
    for t=0:1/num_points:time_periods
        if ~isgraphics(hFig), return; end % Encerra se a figura foi fechada
        
        % Atualiza coordenadas (x,y)
        x = A*cos(2*pi*freq*t);
        y = A*sin(2*pi*freq*t);

        if(buildingSenoid)
            addpoints(senoidAnimation, t, A*sin(2*pi*freq*t));
        end

        set(vector, 'XData',[0; x], 'YData',[0; y]);        % Desenha vetor girante

        % Refresh nos gráficos
        drawnow;
    end
    buildingSenoid = false;
    pause(1);
end