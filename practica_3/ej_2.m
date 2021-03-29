    %Vectores para los ejes X, Y
    X = [ 1.0	1.0	1.0	1.0	1.0	0.9	0.9	0.9	0.9	0.9	0.8	0.8	0.8	0.8	0.8	0.7	0.7	0.7	0.7	0.7	0.6	0.6	0.6	0.6	0.6	0.5	0.5	0.5	0.5	0.5	0.4	0.4	0.4	0.4	0.4	0.3	0.3	0.3	0.3	0.3	0.2	0.2	0.2	0.2	0.2	0.1	0.1	0.1	0.1	0.1	0.0	0.0	0.0
];
    Y = [65.0	71.0	70.0	72.0	68.0	68.0	66.0	65.0	64.0	63.0	63.0	60.0	59.0	58.0	57.0	56.0	53.0	52.0	51.0	49.0	49.0	46.0	45.0	44.0	41.0	41.0	40.0	39.0	38.0	37.0	37.0	35.0	33.0	32.0	31.0	29.0	27.0	26.0	25.0	24.0	24.0	21.0	20.0	19.0	18.0	16.0	13.0	12.0	11.0	9.0	9.0	7.0	6.0
 ];

    x_trasp = [ 0.0	0.0	0.0	0.1	0.1	0.1	0.1	0.1	0.2	0.2	0.2	0.2	0.2	0.3	0.3	0.3	0.3	0.3	0.4	0.4	0.4	0.4	0.4	0.5	0.5	0.5	0.5	0.5	0.6	0.6	0.6	0.6	0.6	0.7	0.7	0.7	0.7	0.7	0.8	0.8	0.8	0.8	0.8	0.9	0.9	0.9	0.9	0.9	1.0	1.0	1.0	1.0	1.0
    ];

    y_trasp = [ 7.0	9.0	10.0	12.0	13.0	15.0	16.0	17.0	18.0	22.0	24.0	25.0	28.0	29.0	31.0	32.0	33.0	35.0	37.0	34.0	36.0	37.0	39.0	40.0	41.0	41.0	43.0	41.0	42.0	44.0	45.0	48.0	49.0	51.0	52.0	53.0	56.0	56.0	57.0	58.0	59.0	60.0	63.0	63.0	64.0	65.0	66.0	68.0	68.0	72.0	70.0	71.0	65.0
];
    
    %Trazo del gráfico y rectas
    plot(X, Y, '.', 'MarkerSize', 10)
    ylabel('Valor medido')
    xlabel('Valor real')
    hold on

    %Trazo del gráfico y rectas traspuesta
    plot(x_trasp, y_trasp, '.', 'MarkerSize', 10)
    hold on

    %Se hace el cálculo de la recta de Puntos Extremos
    [m1, b1] = PunExtremos(X, Y);
    y_ext = m1 * X + b1;
    plot(X, y_ext)

    %Se hace el cálculo de la recta de Mínimos Cuadrados
    [m2, b2] = MinCuadrados(X.', Y.');
    y_min = m2 * X + b2;
    %plot(X, y_min)
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