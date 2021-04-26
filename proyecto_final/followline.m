%Declaracion global de variables
global intensity_v;
global tiempo_v;
%% Inicialización de variables
found = 0;
gray = 25; %Valor medio de gris
k = 0;
b = 0.1213;
intensity_v = 0;
tiempo_v = 0;
tiempo = 0;

%Sensor
% Informamos que el sensor de color está en el puerto 1
SetSensorLight(IN_1);

% Definimos la velocidad de avance nominal
v = 15;

%% Esperar al botón central de robot para empezar
TextOut(0,LCD_LINE1,'Seguimiento trayectoria'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Armando-Enrique'); % Integrantes
TextOut(0,LCD_LINE3,'Presione el boton central');
TextOut(0,LCD_LINE4,'para comenzar');
TextOut(0,LCD_LINE7,'MECATRONICA 2020-2021');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen();

% Avanzamos con velocidad v en las dos ruedas (OUT_AC)
OnFwd(OUT_AC, v);

%Mientras no se presione el botón hacia abajo
while(~ButtonPressed(BTNEXIT)) 
    % Leemos el sensor  
    intensity = double(Sensor(IN_1));
    % Incrementamos el tiempo (período de muestreo 50ms)
	tiempo = tiempo + 0.05; 
    intensity_v = [intensity_v intensity];
    tiempo_v = [tiempo_v tiempo];
    cadena = ['intensidad = ' num2str(intensity)];
    TextOut(0,LCD_LINE1,cadena);
    if tiempo > 1
        if intensity >= gray && intensity <= gray+25 && found == 0
            % paramos los motores       
            Off(OUT_AC);
            found = 1;
        end
        if found == 1
            ClearScreen();
            TextOut(0,LCD_LINE1,'Presione el botón central');
            while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
            found = 2;
            ClearScreen();
        end
        if found == 2
            OnFwd(OUT_A, 10); %rueda izquierda
            OnFwd(OUT_C, 5); %rueda derecha
        end

    end

end

%Seguimiento de línea
% wk = -k*(linecolour - grey);
% vik = v - b * wk;
% vdk = v + b * wk;

% wki = vik/r
% wkd = vdk/r
% paramos los motores       
Off(OUT_AC);

% paramos la comunicación con Coppeliasim
Stop(1);