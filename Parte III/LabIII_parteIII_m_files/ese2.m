y0=[pi/6, 0];
tslot=[0,10];
[x,y]=ode45(@f3, tslot, y0);
plot(x,y(:,1), 'r')
hold on
plot(x,y(:,2),'b')
legend('spostamento', 'velocita')
