function MenuIngresarDatos()
    global x y p;
    
    % Ingresar datos entre []
    % ejemplo [1,2,3]
    x=input('Ingresar las x: ');
    y=input('Ingresar las f(x): ');
    
    clc;
    disp('IngresarDatos');
    disp('1. Interpolar por Lagrange');
    disp('2. Interpolar por Newton');
    disp('3. Volver al menú principal');
    i=input('Seleccione su opción: ');
    
    while i ~= 3
        switch i
            case 1
                p = Lagrange(x,y,0);
                disp(strcat('P(x) = ', char(p)));
            case 2
                disp('2')
            otherwise
                disp('Opción no válida')
        end
        disp('---------------------------');
        disp('IngresarDatos');
        disp('1. Interpolar por Lagrange');
        disp('2. Interpolar por Newton');
        disp('3. Volver al menú principal');
        i=input('Seleccione su opción: ');
    end
end