function p = NGRegresivo(x,y, mostrarPasos)
    global t pasito coef;
    p=0;
    t = sym('x');
	n = length(x);
	DD = zeros(n);
	DD(:,1)=y;
	for k=2:n
		for J=k:n
			DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[x(J)-x(J-k+1)];
        end
	end
    %if (mostrarPasos == 1)
        disp('La matriz de diferencias divididas es:');
        pasito=num2str(DD);
        disp(DD);
    %end
    [filas,columnas] = size(DD);
    coeficientes = zeros(columnas);
    for v=1:columnas
        coeficientes(v) = DD(filas,v);
    end
    %if (mostrarPasos == 1)
    disp('Los coeficientes del polinomio son:');
    coef = mat2str(coeficientes(:,1));
    disp(coeficientes(:,1));
    %end
    for z=1:length(coeficientes)
        pol2 = 1;
        for o=1:length(x)
            if (o < z)
                pol2 = pol2*(t-x(length(x)-(o-1)));
            end
        end
        p = p+(coeficientes(z)*pol2);
    end
    %if (mostrarPasos == 1)
    %    disp('El polinomio sin factorizar es:');
    %    disp(p);
    %end
    p = simplify(p);
    %if (mostrarPasos == 1)
        disp('El grado del polinomio es:');
        disp(polynomialDegree(p));
        if(sonPuntosEquiespaciados(x))
            disp('Los puntos ingresados son equiespaciados');
        else
            disp('Los puntos ingresados NO son equiespaciados');
        end
    %end
end