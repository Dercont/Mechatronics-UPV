disp('Ejecución del modelo de ev3 en CoppeliaSim. Cambie a la ventana del simulador');
pause(2);

%Declaracion global de variables
global intensity_v;
global tiempo_v;

%Inicialización de variables
intensity_v = 0;
tiempo_v = 0;
disp('--------SEGUIMIENTO TRAYECTORIA--------');

ejecutarCodigoNXC followline

%Representar la referencia y la estimación de la posición que hace el robot
hold on
plot(tiempo_v,intensity_v)
title('Trayectoria Deseada vs Trayectoria Realizada')
hold off
grid on;