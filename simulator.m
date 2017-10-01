% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

% Parâmetros da senoide
freq = 1;           % Frequência (Hz)
A = 4;              % Amplitude

% Parâmetros da Animação
periods = 2;                % Período (com base no período fundamental 2pi)
num_points = 100;           % Quantidades de pontos total da senóide
time_periods = (1/freq) * periods;

% Gerando pontos da circunferência no plano (x, y)
t = linspace(0, 2*pi, 50);
x = cos(t)*A - A;  % Deslocando p/ antes da origem
y = sin(t)*A;

% Plotando circunferência
line(x, y, 'LineWidth',2);                       % Plota circunferência
line([0 0], [-A-1 A+1], 'Color','k')             % Plota eixo Y=0, separando circunferência da senóide
grid on, box on
axis equal
axis([-2*A time_periods+1 -A A])
xlabel('Ângulo \theta (radianos)')
title('Efeito Estroboscópico')

% Preparando objetos animados
vector = line(ones(1,2), ones(1,2), 'LineWidth',1); % Inicializando linha
senoidLine = line(ones(1,2), ones(1,2), 'LineWidth',1, 'LineStyle','-', 'Color', 'red');

% Preparando senoide
senoidAnimation = animatedline('Color',vector.Color, 'LineWidth',2);
legend(senoidAnimation, strcat(num2str(A),'sin(', num2str(freq), '\theta)'), 'Location','EastOutside');

buildingSenoid = true;

while true
    for t=0:1/num_points:time_periods

        % Atualiza coordenadas (x,y)
        x = A*cos(2*pi*freq*t);
        y = A*sin(2*pi*freq*t);

        % Atualiza os gráficos com os pontos atuais
        if(buildingSenoid)
            addpoints(senoidAnimation, t, A*sin(2*pi*freq*t));
        end

        set(senoidLine, 'XData',[x-A; t], 'YData',[y; y]);
        set(vector, 'XData',[0; x] - A, 'YData',[0; y]);        % Desenha vetor girante
            
        % Refresh nos gráficos
        drawnow;
    end
    buildingSenoid = false;
    pause(1);
end