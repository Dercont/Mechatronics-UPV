disp('Ejecuci�n del modelo de ev3 en CoppeliaSim. Cambie a la ventana del simulador');
pause(2);

global datos;
datos = [];

disp('--------SEGUIMIENTO TRAYECTORIA--------');
ejecutarCodigoNXC ej4

%Representar la referencia y la estimaci�n de la posici�n que hace el robot
hold on
plot(datos(:,1),datos(:,2)); 
plot(datos(:,3),datos(:,4)); 
title('Trayectoria Deseada vs Trayectoria Realizada')
hold off
grid on;

%Mostrar el error cuadr�tico
error_cua = mean(datos(:,5))