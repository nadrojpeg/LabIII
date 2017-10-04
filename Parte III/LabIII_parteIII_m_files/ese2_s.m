f=@(x,y)(-log(2)*y/50);
y0=1;
h=1;
tspan=[0, 200];
[x,u]=RK4(f,tspan,y0,h);
plot(x,u,'r');
y=find(u<=0.1);
x(y(1))
hold on
plot(x(y(1)), u(y(1)), '*b'); 