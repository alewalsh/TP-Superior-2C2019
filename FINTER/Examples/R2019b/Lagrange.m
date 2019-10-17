function p = Lagrange(x,y)
    p=0;
    t = sym('x');
    n = length(x);
    for i=1:n
        L=1;
        for j=1:n
            if i ~= j
                L = L*(t-x(j))/(x(i)-x(j));
            end
        end
        p = p+L*y(i);
        p= simplify(p);
    end
end