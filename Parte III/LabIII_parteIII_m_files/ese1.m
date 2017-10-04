y0=[1200, 0];
tslot=[0, 15];
h=0.01;
[x,y]=RK4(@f, tslot, y0, h);
y1=[y(1,1501), y(2,1501)];
tslot1=[15,147];
[t,u]=RK4(@f2, tslot1, y1, h); 
subplot(2,1,1)
plot(x, y(1, :), 'r')
hold on
plot(t, u(1,:), 'b')
legend('p. chiuso', 'p. aperto')
title('spostamento')
subplot(2,1,2)
plot(x, y(2, :), 'r')
hold on
plot(t,u(2,:),'b')
legend('p. chiuso', 'p. aperto')
title('velocità')

