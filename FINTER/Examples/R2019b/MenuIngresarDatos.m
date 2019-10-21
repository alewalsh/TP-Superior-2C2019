function MenuIngresarDatos()
    global x y p;
    
    disp('Ingresar datos entre []');
    disp('ejemplo [1,2,3]');
    x=input('Ingresar las x: ');
    y=input('Ingresar las f(x): ');

    disp('Ingresar Datos');
    disp('1. Interpolar por Lagrange');
    disp('2. Interpolar por Newton');
    disp('3. Volver al menú principal');
    i=input('Seleccione su opción: ');
    
    while i ~= 3
        switch i
            case 1
                p = Lagrange(x,y,0);
                output(p);
            case 2
                disp('---------------------------');
				disp('Ingresar Datos:');
				disp('1. Interpolar por Newton Gregory Progresivo');
				disp('2. Interpolar por Newton Gregory Regresivo');
				disp('Otro. Volver');
				j=input('');
				switch j
					case 1
						p = NGProgresivo(x,y, 0);
						output(p);
					case 2
						p = NGRegresivo(x,y, 0);
						output(p);
					otherwise
				end
			case 3
				break
            otherwise
                disp('Opción no válida')
        end
        disp('---------------------------');
        disp('Ingresar Datos');
        disp('1. Interpolar por Lagrange');
        disp('2. Interpolar por Newton');
        disp('3. Volver al menú principal');
        i=input('Seleccione su opción: ');
    end
end

function output(p)
	mensaje = {'P(x) = ', char(p), '---------------------------'};
	fprintf('%s\n%s%s\n%s', mensaje{3}, mensaje{1}, mensaje{2}, mensaje{3});
end