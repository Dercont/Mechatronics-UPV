function [dot_xc, dot_yc] = controlador_pv( Trayectoria,theta,x,y)
    %TEST
    % x= x_init;
    % y = y_init;
    % theta = theta_init;
    % Kx = 5;
    % Ky = 5;
    % e = 100;

    %Referencias X,Y,dot_xref, dot_yref
    % xref = Trayectoria(:,2);
    % yref = Trayectoria(:,3);
    % dot_xref = Trayectoria(:,4);
    % dot_yref = Trayectoria(:,5);

    deriv = [];

    for i = 1:size(Trayectoria,1) 
        %Calculo de las matrices
        ma1 = [Trayectoria(i,4);Trayectoria(i,5)];
        ma2 = [Kx,0;0,Ky];
        ma3 = [(Trayectoria(i,2) - (x + e * cos(theta))) ; (Trayectoria(i,3) - (y + e * sin(theta)))];
        
        %Generación de las derivadas de la posición del punto descentralizado
        temp = ma1 + ma2 * ma3;
        temp_t = temp.';

        %Puntos con respecto a la velocidad
        deriv = [deriv;temp_t];
    end

    dot_xc = deriv(:,1);
    dot_yc = deriv(:,2);

end