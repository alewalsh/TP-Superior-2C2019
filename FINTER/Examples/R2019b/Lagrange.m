function p = Lagrange(x,y,mostrarPasos)
    global t;
    p=0;
    t = sym('x'); % creo la variable simbólica x para reemplazar en la función
    n = length(x);
    
    for i=1:n
        L=1;
        for j=1:n
            if i ~= j
                L = L*(t-x(j))/(x(i)-x(j));
            end
        end
        if (mostrarPasos == 1)
            disp(strcat("L", num2str(i-1),"(x) = ", char(L)));
        end
        p = p+L*y(i);
        p= simplify(p);
    end
end