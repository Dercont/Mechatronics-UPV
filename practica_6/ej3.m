function [dot_xc, dot_yc] = controlador_pv( Trayectoria,theta,x,y)
    %TEST
    % x= x_init;
    % y = y_init;
    % theta = theta_init;
    Kx = 4.5;
    Ky = 4.5;
    e = 100;

    %Referencias X,Y,dot_xref, dot_yref
    ref = Trayectoria(1:2);
    dot_ref = Trayectoria(3:4);

    %Calculo de las matrices
    ma1 = [dot_ref(1);dot_ref(2)];
    ma2 = [Kx 0; 0 Ky];
    ma3 = [(ref(1) - (x + e * cos(theta))) ; ref(2) - (y + e * sin(theta))];
    
    %Generación de las derivadas de la posición del punto descentralizado
    deriv = ma1 + ma2 * ma3;

    %Puntos con respecto a la velocidad
    dot_xc = deriv(1);
    dot_yc = deriv(2);

end