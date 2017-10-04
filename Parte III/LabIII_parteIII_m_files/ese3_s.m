f=@(x,y)(0.2*y*(1-(y/0.01)));
[x,u]=ode45(f,[0,0.5], 2);
plot(x,u, 'r');
hold on
z=find(u<=0.2);
plot(x(z(1)),u(z(1)), '*b');