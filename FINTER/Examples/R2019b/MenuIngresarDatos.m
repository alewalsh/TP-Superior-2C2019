function MenuIngresarDatos()
    global x y p t e;
    % t es la variable simbólica del polinomio
    % p es el polinomio calculado, puede ser Lagrange o Newton, lo guardo para
    % calcular P(k) según el polinomio que tengamos
    % e es para decir que existe un polinomio calculado de un conjunto de datos para evitar entrar en lugares de calculo, sin datos
    
    mostrarPasos = '3. Mostrar/Esconder los pasos del calculo (Escondidos)';
    pasos = 0;
    cargarDatos();     
    while 1
        
            disp('---------------------------');
            disp('Acciones:');
            disp('1. Interpolar por Lagrange');
            disp('2. Interpolar por Newton');
            disp(mostrarPasos);
            disp('4. Especializar ultimo polinomio calculado en un valor K')
            disp('5. Volver a cargar datos')
            disp('6. Salir');
            i=input('Seleccione su opción: ');
        
        switch i
            
            case 1 %calcular el polinomio con Lagrange
                p = Lagrange(x,y,pasos);
                e = true;
                output(p);
                outputGradoPolinomio();

                
            case 2 %calcular el polinomio con Newton Gregory
                disp('---------------------------');
				disp('1. Interpolar por Newton Gregory Progresivo');
				disp('2. Interpolar por Newton Gregory Regresivo');
				disp('Otro numero. Volver');
				j=input('Seleccione su accion: ');
		
				switch j
					case 1 %calcular el polinomio con Newton Gregory Progresivo
						 p = NGProgresivo(x,y,pasos);
						 e = true;
						 output(p);
                                                 outputGradoPolinomio();
					case 2 %calcular el polinomio con Newton Gregory Regresivo
						 p = NGRegresivo(x,y,pasos);
						 e = true;
						 output(p);
                                                 outputGradoPolinomio();
					otherwise
						disp('Opcion no valida');
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
            
            case 5 %cargar un nuevo juego de datos
                while 1
                    
                disp('---------------------------');
		disp('1. Agregar elemento');
		disp('2. Quitar elemento');
                disp('3. Volver a ingresar todos los datos');
		disp('Otro numero. Volver');
		j=input('Seleccione su accion: ');
                switch j
                    case 1
                        disp('Ingrese el valor X a agregar:');
                        nuevoX=input('');
                        disp('Ingrese el valor F(x) a agregar:');
                        nuevoFx=input('');
                        if not(isempty( str2double( nuevoX ) )) && not(isempty( str2double( nuevoX ) ))
                            x = agregarElemento(x,nuevoX);
                            y = agregarElemento(y,nuevoFx);
                            disp('conjunto de X');
                            disp(x);
                            disp('conjunto de F(x)');
                            disp(y);
                        else
                            disp('ingrese nuevamente los valores')
                        end
                     case 2
                         disp('A continuacion se muestran los valores cargados. Ingrese la posicion del valor a borrar:');
                         disp(x);
                         indice=input('');
                         x = eliminarElemento(x,indice);
                         y = eliminarElemento(y,indice);
                     case 3
                         cargarDatos();
                         break
                    otherwise   
                         break
                    end
                end
                
       	    case 6 %salir al menu principal para salir
                break;
            otherwise
                disp('Opcion no valida');
        end
    end
end

function output(p)
    mensaje = {'P(x) = ', char(p), '---------------------------'};
    fprintf('%s\n%s\n%s%s\n%s\n', mensaje{3}, mensaje{3}, mensaje{1}, mensaje{2}, mensaje{3});
end


function matriz = eliminarElemento(matriz, indice)
    tamanio = size(matriz);
    if(indice <= tamanio(1,2))
        matriz(indice)=[];
    end
end

function matriz = agregarElemento(matriz, elemento)
    tamanio = size(matriz);
    matriz(1, tamanio(1,2)+1)= elemento;
end

function cargarDatos()
    global x y;
    disp('Ingresar datos entre []');
    disp('ejemplo [1,2,3,3.1415]');
    x=input('Ingresar las x: ');
    y=input('Ingresar las y=f(x): ');
    
    conjuntoIncorrecto = true; 
    while conjuntoIncorrecto  
       if(chequearXY() ) %chequeo que existan, tenga al menos un valor y coincidan el tamaño (el 2 es la 2da dimension de la matriz 1*n)
           conjuntoIncorrecto = false;
       else
           disp('por favor, ingrese datos y asegurese que haya igual cantidad');
           disp('Ingresar datos entre []');
           disp('ejemplo [1,2,3.1415]');
           x=input('Ingresar las x: ');
           y=input('Ingresar las f(x): ');
       end
    end
end

function outputGradoPolinomio()
    global p;
    tamanioPol = size(coeffs(p,'All'));
    grado = tamanioPol(1,2)-1;
    display = "grado del polinomio: " + grado;
    output(display);
end

function bool = chequearXY()
    global x y;
    bool = not(isempty(x)) && not(isempty(y)) && (size(x, 2) == size(y, 2));
end