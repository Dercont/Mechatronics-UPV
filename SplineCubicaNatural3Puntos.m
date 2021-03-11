function out = SplineCubicaNatural3Puntos(Puntos,incremento_real,tiempo_real)
% Función que calcula una trayectoria Curva Spline 3 puntos
% Puntos = [P0x P0y;P1x P1y;P2x P2y];
% Incremento Real = Tiempo de muestreo
% Tiempo Real = tiempo total de la trayectoria.

%Calculo del parámetro de avance de la curva:
out = [];
tramos = size(Puntos,1) - 1;
inc = incremento_real / (tiempo_real / tramos);

%Cálculo de las derivadas para 3 puntos de partida (Dx,Dy)
ma_constante =  inv([2 1 0; 1 4 1; 0 1 2]);
ma3_puntosx = ma_constante * [3 * (Puntos(2,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(1,1)); 3 * (Puntos(3,1) - Puntos(2,1))];
ma3_puntosy = ma_constante * [3 * (Puntos(2,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(1,2)); 3 * (Puntos(3,2) - Puntos(2,2))];

%Calculando las derivadas
derx = ma_constante * ma3_puntosx;
dery = ma_constante * ma3_puntosy;

%Calculando matriz abcd
r = [];
for i = 1:tramos
    %x
    ax = Puntos(i,1);
    bx = derx(i);
    cx = 3 * (Puntos(i+1,1) - Puntos(i,1)) - 2 * derx(i) - derx(i+1);
    dx = 2 * (Puntos(i,1) - Puntos(i+1,1)) + derx(i) + derx(i+1);
    %y
    ay = Puntos(i,2);
    by = dery(i);
    cy = 3 * (Puntos(i+1,2) - Puntos(i,2)) - 2 * dery(i) - dery(i+1);
    dy = 2 * (Puntos(i,2) - Puntos(i+1,2)) + dery(i) + dery(i+1);
    
    ma_abcd = [ax bx cx dx; ay by cy dy];
    for t = 0:inc:1
        punto_curva = ma_abcd * [1; t; t^2; t^3];
        r = [r, punto_curva];
    end
    
end
out = r.';

end