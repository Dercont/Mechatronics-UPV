function [v_der, v_izq] = Cinematica_Inversa(dot_xc,dot_yc,theta)
    %TEST
    % theta = theta_init;
    e = 100;
    b = 56;
   
    %Punto de Descentralizado
    p_descentrado = [dot_xc; dot_yc];

    %Calculo de las matrices
    cin_inv = [(cos(theta)+(b/e)*sin(theta)) (sin(theta)-(b/e)*cos(theta));...
          (cos(theta)-(b/e)*sin(theta)) (sin(theta)+(b/e)*cos(theta)) ];
    
    lefrig = 1/2 * cin_inv * p_descentrado;

  %Calculo de velocidades
    v_izq = lefrig(1);
    v_der = lefrig(2);

end