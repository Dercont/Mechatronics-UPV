function [v_der, v_izq] = Cinematica_Inversa(dot_xc,dot_yc,theta)
global uk_1 ek_1;

e = 100;
b = 56;

%TEST
% theta = 90;
% dot_xc = 3;
% dot_yc = 3;

%Punto de Centreado
p_centrado = [dot_xc;dot_yc];

%Calculo de las matrices
ma1 = (cos(theta)+(b/e)*sin(theta)) * (sin(theta)-(b/e)*cos(theta));
ma2 = (cos(theta)-(b/e)*sin(theta)) * (sin(theta)+(b/e)*cos(theta));
mu3 = 1/2 * [ma1;ma2];

%Calculo de velocidades
lefrig = mu3 .* p_centrado;

v_der = lefrig(1,1);
v_izq = lefrig(2,1);