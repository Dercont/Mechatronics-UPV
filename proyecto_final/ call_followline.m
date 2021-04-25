disp('Ejecución del modelo de ev3 en CoppeliaSim. Cambie a la ventana del simulador');
pause(2);

global datos;
datos = [];

disp('--------SEGUIMIENTO TRAYECTORIA--------');
ejecutarCodigoNXC followline

%Representar la referencia y la estimación de la posición que hace el robot
hold on
plot(); 
plot(); 
title('Trayectoria Deseada vs Trayectoria Realizada')
hold off
grid on;