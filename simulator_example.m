% Configurando a tela
pos = get(groot, 'DefaultFigurePosition');
hFig = figure('Position',pos .* [1 1 1.5 0.9]);
movegui(hFig, 'center')

h = animatedline;

f0 = 100; % Frequência da senoide

numpoints = 100000;
x = linspace(0,2*pi*f0,numpoints);
y = sin(x);
for t = 0:1/numpoints:1 % Visualizando 1 segundo do sinal
    addpoints(h,t,sin(2*pi*f0*t))
    pause(0.00001);
end