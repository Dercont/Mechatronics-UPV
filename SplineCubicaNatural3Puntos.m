function out = SplineCubicaNatural3Puntos(Puntos,incremento_real,tiempo_real)
% Función que calcula una trayectoria Curva Spline 3 puntos
% Puntos = [P0x P0y;P1x P1y;P2x P2y];
% Incremento Real = Tiempo de muestreo
% Tiempo Real = tiempo total de la trayectoria.

%Calculo del parámetro de avance de la curva:
tramos=size(Puntos,1)-1
inc = Incremento_real / (tiempo_real/tramos)

%Cálculo de las derivadas para 3 puntos de partida (Dx,Dy)
ma_constante = [2 1 0; 1 4 0; 0 1 2];
ma3_puntos = [3 * [PtosControl(2,1)-PtosControl(1,1)];]


%segmentando las traspuestas
p0 = Puntos(1,:)';
p1 = Puntos(2,:)';
p2 = Puntos(3,:)';
p3 = Puntos(4,:)';

%Matriz 2x4
m =  [p0 p1 p2 p3];

%Matriz 4x4
m2 = [1 -3 3 -1; 0 3 -6 3; 0 0 3 -3; 0 0 0 1];

%Curva de Bézier
c = [];

% Cálculo de cada punto y de la curva
    for i=0:incremento_real/tiempo_real:1
        r = m*m2*[1;i;i^2;i^3];
        c = [c; r'];
    end
out = c;
end