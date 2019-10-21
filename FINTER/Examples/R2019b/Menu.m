global x y t p e;
% t es la variable simbólica del polinomio
% p es el polinomio calculado, puede ser Lagrange o Newton, lo guardo para
% calcular P(k) según el polinomio que tengamos
% e es para decir que existe un conjunto de datos para evitar entrar en lugares de calculo, sin datos

disp('---------------------------');
disp('Bienvenido a FINTER');
disp('---------------------------');
disp('1. Ingresar datos');
disp('2. Alterar valores iniciales');
disp('3. Finalizar');
disp('---------------------------');

i=input('Seleccione su opción: ');
while 1
    switch i
        case 1
            MenuIngresarDatos;
        case 2
            disp('3');
        case 3
            break
        otherwise
            disp('Opción no válida')
    end
    disp('---------------------------');
    disp('1. Ingresar datos');
    disp('2. Alterar valores iniciales');
    disp('3. Finalizar');
    i=input('Seleccione su opción: ');
end

disp('Gracias por utilizar FINTER')
close all;