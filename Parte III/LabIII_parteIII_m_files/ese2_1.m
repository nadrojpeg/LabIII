f=@(x,y) (-y);

subplot(2,2,1);
[x,u]=eulero(f, [0;10], 1, 0.5);
plot(x,u,'r');
hold on
plot(x,exp(-x),'b');
legend('metodo Eulero', 'soluzione esatta');
title('h=0.5');

subplot(2,2,2);
[x,u]=eulero(f, [0;10], 1, 1);
plot(x,u,'r');
hold on
plot(x,exp(-x),'b');
legend('metodo Eulero', 'soluzione esatta');
title('h=1');

subplot(2,2,3);
[x,u]=eulero(f, [0;10], 1, 2);
plot(x,u,'r');
hold on
plot(x,exp(-x),'b');
legend('metodo Eulero', 'soluzione esatta');
title('h=2');

subplot(2,2,4);
[x,u]=eulero(f, [0;10], 1, 2.5);
plot(x,u,'r');
hold on
plot(x,exp(-x),'b');
legend('metodo Eulero', 'soluzione esatta');
title('h=2.5');
