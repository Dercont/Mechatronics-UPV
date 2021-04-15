function [VM,ek] = PID(Referencia,VC,Kp,Ti,Td)
Ts = 0.02;
global uk_1 ek_1;

% Calcular el Error COMPLETAR
ek = Referencia - VC ;
% Calcular la Acción de control COMPLETAR
up = Kp*ek;
ui = Kp/Ti *ek ;
ud = Kp*Td  ;

uk =  up + ui + ud;

%Saturar la Acción de Control (-100,+100) COMPLETAR
if (uk >= (100))
    uk = uk ;%falta
    ui = uk_1;
end     
if (uk <= (-100))
    uk = uk;%falta
    ui = uk_1;
end

% Sumamos Punto Funcionamiento a la Accion de Control
VM = uk;

% Actualizar variables
uk_1 = ui;
ek_1 = ek;