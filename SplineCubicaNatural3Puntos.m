function out = SplineCubicaNatural3Puntos(Puntos,incremento_real,tiempo_real)
% Función que calcula una trayectoria Curva Spline 3 puntos
% Puntos = [P0x P0y;P1x P1y;P2x P2y];
% Incremento Real = Tiempo de muestreo
% Tiempo Real = tiempo total de la trayectoria.

%Calculo del parámetro de avance de la curva:
out = [];
tramos = size(Puntos,1) - 1;
inc = incremento_real / (tiempo_real / 2);

%Cálculo de las derivadas para 3 puntos de partida (Dx,Dy)
ma_constante =  [2 1 0; 1 4 1; 0 1 2];
ma3_puntosx = [3 * (Puntos(2,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(2,1))];
ma3_puntosy = [3 * (Puntos(2,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(2,2))];

%Calculando las derivadas
% dx = inv(ma_constante) * [3 * (Puntos(2,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(2,1))];
% dy = inv(ma_constante) * [3 * (Puntos(2,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(2,2))];
dx = ma_constante * ma3_puntosx;
dy = ma_constante * ma3_puntosy;

%Calculando matriz abcd
for i = 1:2
    %x
    ax = Puntos(i,1);
    bx = dx(1,i);
    cx = 3 * Puntos((i+1),1) - Puntos(i,1) - 2 * dx(i) - dx(i+1);
    dx = 2 * Puntos(i,1) - Puntos((i+1),1) + dx(i) + dx(i+1);
    %y
    ay = Puntos(i,2);
    by = dy(i);
    cy = 3 * Puntos((i+1),2) - Puntos(i,2) - 2 * dy(i) - dy(i+1);
    dy = 2 * Puntos(i,2) - Puntos((i+1),2) + dy(i) + dy(i+1);
    
    ma_abcd = [ax bx cx dx; ay by cy dy;];
    r = [];
    for t = 0:inc:1
        punto_curva = ma_abcd * [1; t; t^2; t^3];
        r = [r, punto_curva];
    end
end
out = r.';

end