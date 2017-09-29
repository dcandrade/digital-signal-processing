% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

% Parâmetros da Animação
periods = 2;                % Período (com base no período fundamental 2pi)
num_steps = 100 * periods;  % Animações por período

% Parâmetros da senoide
freq = 1;           % Frequência (rad/s)
A = 4;              % Amplitude

% Gerando pontos da circunferência no plano (x, y)
t = linspace(0, 2*pi, 50);
x = cos(t)*A - A;  % Deslocando p/ antes da origem
y = sin(t)*A;

% Configurando a tela

% Plotando circunferência
line(x, y, 'LineWidth',2);                   % Plota circunferência
line([0 0], [-A-1 A+1], 'Color','k')             % Plota eixo Y=0, separando circunferência da senóide
grid on, box on
axis equal
axis([-2*A 2*pi*periods -A A])
xlabel('Ângulo \theta (radianos)')
title('Efeito Estroboscópico')
xticks([0, pi/2, pi, 3*pi/2, 2*pi]);
xticklabels([{'0','\pi/2','\pi','3\pi/2', '2\pi'}])

% Preparando objetos animados
vector = line(ones(1,2), ones(1,2), 'LineWidth',1); % Inicializando linha
senoidLine = line(ones(1,2), ones(1,2), 'LineWidth',1, 'LineStyle','-', 'Color', 'red');

% Preparando senoide
steps = linspace(0, 2*pi*periods, num_steps);  % Gerando passos para a animação da senóide
senoidAnimation = animatedline('Color',vector.Color, 'LineWidth',2);
legend(senoidAnimation, strcat(num2str(A),'sin(', num2str(freq), '\theta)'), 'Location','EastOutside');


theta = pi;                          % Ângulo atual (radianos)
step = (steps(2)-steps(1)) * freq;  % Tamanho de cada passo da animação
buildingSenoid = true;

while true
    for i=1:num_steps
        % Encerra se a figura foi fechada

        % Atualiza coordenadas (x,y)
        x = A * cos(theta);
        y = A * sin(theta);

        % Atualiza os gráficos com os pontos atuais
        if(buildingSenoid)
            addpoints(senoidAnimation, steps(i), y);
        end
        set(senoidLine, 'XData',[x-A; steps(i)], 'YData',[y; y]);
        set(vector, 'XData',[0; x] - A, 'YData',[0; y]);        % Desenha vetor girante

        % Incrementa o ângulo
        theta = theta - step;
            
        % Refresh nos gráficos
        pause(0.01);
    end
    theta = pi;
    buildingSenoid = false;
    pause(1);
end