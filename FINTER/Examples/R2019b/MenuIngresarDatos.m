function MenuIngresarDatos()
    global x y p t e;
    
    mostrarPasos = '3. Mostrar/Esconder los pasos del calculo (Escondidos)';
    pasos = 0;
    
    disp('Ingresar datos entre []');
    disp('ejemplo [1,2,3,3.1415]');
    x=input('Ingresar las x: ');
    y=input('Ingresar las f(x): ');

    conjuntoIncorrecto = true; 
    while conjuntoIncorrecto  
       if(not(isempty(x)) && not(isempty(y)) && (size(x, 2) == size(y, 2)) ) %chequeo que existan, tenga al menos un valor y coincidan el tamaño (el 2 es la 2da dimension de la matriz 1*n)
           conjuntoIncorrecto = false;
       else
           disp('por favor, ingrese datos y asegurese que haya igual cantidad');
           disp('Ingresar datos entre []');
           disp('ejemplo [1,2,3.1415]');
           x=input('Ingresar las x: ');
           y=input('Ingresar las f(x): ');
       end
    end
    disp('---------------------------');
    disp('Ingresar Datos');
    disp('1. Interpolar por Lagrange');
    disp('2. Interpolar por Newton');
    disp(mostrarPasos);
    disp('4. Especializar ultimo polinomio calculado en un valor K')
    disp('5. Volver al menú principal');
    i=input('Seleccione su opción: ');
        
    while 1
        
        switch i
            
            case 1 %calcular el polinomio con Lagrange
                p = Lagrange(x,y,pasos);
                e = 1;
                output(p);
                
            case 2 %calcular el polinomio con Newton Gregory
                disp('---------------------------');
		disp('Ingresar Datos:');
		disp('1. Interpolar por Newton Gregory Progresivo');
		disp('2. Interpolar por Newton Gregory Regresivo');
		disp('Otro. Volver');
		j=input('');
		switch j
   			case 1 %calcular el polinomio con Newton Gregory Progresivo
			     p = NGProgresivo(x,y,pasos);
                             e = 1;
		             output(p);
   			case 2 %calcular el polinomio con Newton Gregory Regresivo
			     p = NGRegresivo(x,y,pasos);
                             e = 1;
			     output(p);
			otherwise
		end
  
            case 3 %Mostrar los pasos al calcular el algoritmo
                if pasos == 0
                    mostrarPasos = '3. Mostrar/Esconder los pasos del calculo (Mostrar)';
                    disp('Se mostraran los pasos del calculo');
                    pasos = 1;
                else
                    mostrarPasos = '3. Mostrar/Esconder los pasos del calculo (Escondidos)';
                    disp('Se dejaran de mostrar los pasos del calculo');
                    pasos = 0;
                end
                
            case 4 %Especializacion del ultimo polinomio calculado en un punto K
                if e
                    k = input('Ingrese el valor: ');
                    disp(char(subs(p, t, k))); % subs sustituye la variable simbólica t en p por el valor k
                else
                    disp('Primero debe calcularse un polinomio');
                end
                
       	    case 5 %salir al menu principal para reingresar datos o salir
		break
  
            otherwise
                disp('Opción no válida');
                
        end
        disp('---------------------------');
        disp('Ingresar Datos');
        disp('1. Interpolar por Lagrange');
        disp('2. Interpolar por Newton');
        disp(mostrarPasos);
        disp('4. Especializar ultimo polinomio calculado en un valor K')
        disp('5. Volver al menú principal');
        i=input('Seleccione su opción: ');
        
    end
end

function output(p)
	mensaje = {'P(x) = ', char(p), '---------------------------'};
	fprintf('%s%s\n%s%s\n%s\n', mensaje{3}, mensaje{3}, mensaje{1}, mensaje{2}, mensaje{3});
end