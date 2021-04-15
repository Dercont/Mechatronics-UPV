function [VM,ek] = PID(Referencia,VC,Kp,Ti,Td)
Ts = 0.02;
global uk_1 ek_1;

% Calcular el Error COMPLETAR
ek = Referencia - VC ;
% Calcular la Acción de control COMPLETAR
up = Kp * ek;
ui = uk_1 + (kp/Ti) * ek * Ts;
ud = Kp * Td ((ek - ek_1) / Ts);

uk =  up + ui + ud;

%Saturar la Acción de Control (-100,+100) COMPLETAR
if (uk >= (100))
    uk = 100;
    ui = uk_1;
end     
if (uk <= (-100))
    uk = -100;
    ui = uk_1;
end

% Sumamos Punto Funcionamiento a la Accion de Control
VM = uk;

% Actualizar variables
uk_1 = ui;
ek_1 = ek;