f=@(t, y) fun2_3(t, y);
tspan = [0,5];
init = 1;
esatta = @(t) (exp(-t)*cos(5*t));
A = zeros(10, 3);
for i=1:10
    A(i, 1) = 0.1/(2^(i-1));
    [x, u] = eulero(f, tspan, init, A(i, 1));
    A(i, 2) = abs(u(find(x==2))-esatta(2));
    [x, u] = RK4(f, tspan, init, A(i, 1));
    A(i, 3) = abs(u(find(x==2))-esatta(2));
end