function [m,b] = PuntosExtremos(x,y)
b = y(1);
m = (y(end) -y(1)) / (x(end) -1);

function [m,b] = MinCuadrados(x,y)
    %Se calcula la matriz de regresión
    Z = [ones(size(x)) x];
    bm = Z / y;
    b = bm(1);
    m = bm(2);