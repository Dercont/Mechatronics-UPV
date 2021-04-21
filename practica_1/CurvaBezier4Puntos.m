function out = CurvaBezier4Puntos(Puntos,incremento_real,tiempo_real)
    % Función que calcula una trayectoria Curva Bezier 3 puntos
    % Puntos = [P0x P0y;P1x P1y;P2x P2y;P3x P3y];
    % Incremento Real = Tiempo de muestreo
    % Tiempo Real = tiempo total de la trayectoria.
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