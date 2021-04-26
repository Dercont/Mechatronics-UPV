    %Vectores para los ejes X, Y
    X = [1.0	1.0	1.0	1.0	0.5	0.5	0.5	0.5	0.5	0.5	0.0	0.0	0.0	0.0	0.0	0.0];
    Y = [61.0	62.0	63.0	60.0	59.0	57.0	58.0	56.0	55.0	50.0	39.0	25.0	13.0	12.0	20.0	34.0];
    
    %Trazo del gráfico y rectas
    plot(X, Y, '.', 'MarkerSize', 10)
    ylabel('Valor medido')
    xlabel('Valor real')
    hold on

    %Se hace el cálculo de la recta de Puntos Extremos
    [m1, b1] = PunExtremos(X, Y);
    y_ext = m1 * X + b1;
    plot(X, y_ext)

    %Se hace el cálculo de la recta de Mínimos Cuadrados
    [m2, b2] = MinCuadrados(X.', Y.');
    y_min = m2 * X + b2;
    plot(X, y_min)
    hold off

%Función de Mínimos Cuadrados
function [m, b] = MinCuadrados(x, y)
    R = [ones(size(x)) x];
    bm = R\y;
    b = bm(1);
    m = bm(2);
end

%Función de Puntos Extremos
function [m, b] = PunExtremos(x, y)
    b = y(1);
    m = (y(end) - y(1)) / (x(end) - x(1));
end