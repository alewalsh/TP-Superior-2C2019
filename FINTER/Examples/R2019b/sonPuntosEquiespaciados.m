function b = sonPuntosEquiespaciados(x)
    value = linspace(min(x),max(x),length(x));
    b = isequal(value,x);
end