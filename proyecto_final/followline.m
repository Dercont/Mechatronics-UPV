%% Inicialización de variables
linecolour = 0; %Valor actual de intensidad de la línea
grey = (white-black)/2; %Es una constante
k =0;
b = 0;

global datos; %Matriz donde se guardarán los datos


%% Esperar al botón central de robot para empezar
TextOut(0,LCD_LINE1,'Seguimiento trayectoria'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Armando-Enrique'); % Integrantes
TextOut(0,LCD_LINE3,'Presione el boton central');
TextOut(0,LCD_LINE4,'para comenzar');
TextOut(0,LCD_LINE7,'MECATRONICA 2020-2021');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen();

%Seguimiento de línea
wk = -k*(linecolour - grey);
vik = v - b * wk;
vdk = v + b * wk;

wki = vik/r
wkd = vdk/r

pause(1);