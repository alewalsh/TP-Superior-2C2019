global x y t p;
% t es la variable simbólica del polinomio
% p es el polinomio calculado, puede ser Lagrange o Newton, lo guardo para
% calcular P(k) según el polinomio que tengamos


disp('---------------------------');
disp('Bienvenido a FINTER');
disp('---------------------------');
clc;
disp('1. Ingresar datos');
disp('2. Mostrar pasos de cálculo');
disp('3. Especializar el polinomio en un valor K');
disp('4. Alterar valores iniciales');
disp('5. Finalizar');
disp('---------------------------');

i=input('Seleccione su opción: ');
while i ~= 5
    switch i
        case 1
            clc;
            MenuIngresarDatos;
        case 2
            p = Lagrange(x,y,1);
            disp(strcat('P(x) = ', char(p)));
        case 3
            k = input('Ingrese el valor: ');
            disp(char(subs(p, t, k))); % subs sustituye la variable simbólica t en p por el valor k
        case 4
            disp('4')
        case 5
            break
        otherwise
            disp('Opción no válida')
    end
    disp('---------------------------');
    disp('1. Ingresar datos');
    disp('2. Mostrar pasos de cálculo');
    disp('3. Especializar el polinomio en un valor K');
    disp('4. Alterar valores iniciales');
    disp('5. Finalizar');
    i=input('Seleccione su opción: ');
disp('Gracias por utilizar FINTER')
close all;
end