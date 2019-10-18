function MenuIngresarDatos()
    global x y p;
    n=input('Ingresar cantidad de puntos: ');
    for i=1:n
        x(i)=input('Ingresar x: ');
        y(i)=input('Ingresar y: ');
    end
    
    clc;
    disp('IngresarDatos');
    disp('1. Interpolar por Lagrange');
    disp('2. Interpolar por Newton');
    disp('3. Volver al menú principal');
    i=input('Seleccione su opción: ');
    
    while i ~= 3
        switch i
            case 1
                if length(x) > 1
                    p = Lagrange(x,y,0);
                    disp(strcat('P(x) = ', char(p)));
                else
                    disp(strcat('P(x) = ', char(y)));
                end
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