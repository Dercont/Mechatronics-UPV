function out = CurvaBezier3Puntos(Puntos,incremento_real,tiempo_real)
    % Función que calcula una trayectoria Curva Bezier 3 puntos
    % Puntos = [P0x P0y;P1x P1y;P2x P2y];
    % Incremento Real = Tiempo de muestreo
    % Tiempo Real = tiempo total de la trayectoria.

    %segmentando las traspuestas
    p0 = Puntos(1,:)';
    p1 = Puntos(2,:)';
    p2 = Puntos(3,:)';

    %Matriz 2x3
    m =  [p0 p1 p2];

    %Matriz 3x3
    m2 = [1 -2 1; 0 2 -2; 0 0 1];

    %Curva de Bézier
    c = [];

    % Cálculo de cada punto y de la curva
        for i=0:incremento_real/tiempo_real:1
            r = m*m2*[1;i;i^2];
            c = [c; r'];
        end
    out = c;

end