alpha=@(t)(1/2+cos(2*pi*t));
f=@(t,y)(alpha(t)*y*(1-y/100));
slot=[0,20];
y0=[1,10,50,200];
for i=1:4
    [x,u]=ode45(f, slot, y0(i));
    subplot(2,2,i);
    plot(x,u,'r');
    title(y0(i));
end
