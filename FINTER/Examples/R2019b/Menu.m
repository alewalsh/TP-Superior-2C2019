disp('---------------------------');
disp('Bienvenido a FINTER');
disp('---------------------------');
disp('1. Ingresar datos');
disp('2. Salir');
disp('---------------------------');
i=input('Seleccione su opción: ');

while 1
    switch i
        case 1
            MenuIngresarDatos;
        case 2
            break
        otherwise
            disp('Opción no válida')
    end
    
    disp('---------------------------');
    disp('1. Ingresar datos');
    disp('2. Salir');
    disp('---------------------------');
    i=input('Seleccione su opción: ');
    
end

disp('Gracias por utilizar FINTER')
close all;