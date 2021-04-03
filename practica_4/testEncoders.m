global giroA_v;
global giroC_v;
global tiempo_v;

%Inicialización de variables

giroA_v = 0;
giroC_v = 0;
tiempo_v = 0;
tiempo = 0; Ts = 0.05; %50ms

TextOut(0,LCD_LINE1,'test Encoders'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton intro
ClearScreen(); 

velocidad = 5;

%Test Encoder A

TextOut(0,LCD_LINE1,'Encoder A');
ResetRotationCount(OUT_A); %Reset encoder
giro = MotorRotationCount(OUT_A); % grados
OnFwd(OUT_A, velocidad); % Giro motor A

giroA_v = giro;
while (giro < 1080) % Hasta giro 1080 grados
    t1 = double(CurrentTick());
    tiempo_v = [tiempo_v tiempo];
    giro = MotorRotationCount(OUT_A); 
    NumOut(0, LCD_LINE2, giro);
    giroA_v = [giroA_v giro];
    
    t2 = double(CurrentTick());
    %Esperar hasta siguiente periodo
    espera = (max(0, Ts * 1000 - (t2 - t1)));
    Wait(espera);
    tiempo = tiempo + Ts;
end

NumOut(0, LCD_LINE2, giro);
Off(OUT_A); %Parar motor A
Wait(1000);
ResetRotationCount(OUT_A); %Reset encoder y mostrar en pantalla
giro = MotorRotationCount(OUT_A);
TextOut(0, LCD_LINE2, 'reseteado');
NumOut(0, LCD_LINE3, giro);
Wait(1000);
ClearScreen();

% Test Encoder C
TextOut(0, LCD_LINE1, 'Encoder C');
ResetRotationCount(OUT_C); %Reset encoder
giro = MotorRotationCount(OUT_C); % grados
OnFwd(OUT_C, velocidad); % Giro motor C

while (giro < 1080) 

    NumOut(0, LCD_LINE2, giro);
    giro = MotorRotationCount(OUT_C);

end

NumOut(0, LCD_LINE2, giro);
Off(OUT_C);
Wait(1000);
ResetRotationCount(OUT_C); %Reset encoder y mostrar en pantalla
giro = MotorRotationCount(OUT_C);
TextOut(0, LCD_LINE2, 'reseteado');
NumOut(0, LCD_LINE3, giro);
Wait(1000);
ClearScreen();

plot(tiempo_v, giroA_v);
xlabel Tiempo(seg)
ylabel ('Giro grados/seg')
grid on;