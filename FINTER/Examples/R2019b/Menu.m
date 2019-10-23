global  e;
e=0;
nosalir = true;
while nosalir
    
    disp('---------------------------');
    disp('Bienvenido a FINTER');
    disp('---------------------------');
    disp('1. Ingresar datos');
    disp('2. Salir');
    disp('---------------------------');
    i=input('Seleccione su opción: ');
    
    switch i
        case 1
            MenuIngresarDatos;
            nosalir=false;
        case 2
            nosalir=false;
        otherwise
            disp('Opción no válida')
    end
end

disp('Gracias por utilizar FINTER')
close all;