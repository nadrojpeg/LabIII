% Imposto i parametri
b = 1.04;
a = 1;
ext = 300;

xp=@(x,y)log(b)*x-y;
yp=@(x,y)log(b)*y+x;
xpp=@(x,y)((log(b))^2)*x-2*log(b)*y-x;
ypp=@(x,y)((log(b))^2)*y+2*log(b)*x-y;
curvatura=@(x,y)norm(xp(x,y)*ypp(x,y)-yp(x,y)*xpp(x,y))/((xp(x,y))^2+(yp(x,y))^2)^(3/2);

f = @(x, y) [cos(y(3));sin(y(3));curvatura(y(1),y(2))];

% Risolvo quindi la curva e ne faccio il grafico
[u, y] = ode45(f,[-ext, ext],[a;0;curvatura(a,0)]);
plot(y(:, 1), y(:, 2));
