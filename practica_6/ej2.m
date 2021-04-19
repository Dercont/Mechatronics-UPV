function [v_der, v_izq] = Cinematica_Inversa(dot_xc,dot_yc,theta)
    %TEST
    % theta = theta_init;
    e = 100;
    b = 56;

    lefrig = [];
    
    for i = 1:size(dot_xc,1) 
        %Punto de Centreado
        p_centrado = [dot_xc(i,1);dot_yc(i,1)];
    
        %Calculo de las matrices
        ma1 = (cos(theta)+(b/e)*sin(theta)) * (sin(theta)-(b/e)*cos(theta));
        ma2 = (cos(theta)-(b/e)*sin(theta)) * (sin(theta)+(b/e)*cos(theta));

        %Calculo de velocidades
        temp = 1/2 * [ma1;ma2] .* p_centrado;
        temp_t = temp.';
        
        %Matriz de Velocidades
        lefrig = [lefrig;temp_t];

    end
        v_der = lefrig(:,1);
        v_izq = lefrig(:,2);
end