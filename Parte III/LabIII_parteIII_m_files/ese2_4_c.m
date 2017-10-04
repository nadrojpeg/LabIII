f = @(x, y) (1/x^2)-(y/x)-y^2;
g = @(x) -1./x;
slot = [1, 2];
init = -1;

subplot(2,2,1)
[x, u]=eulero(f, slot, init, 0.5);
[x1, u1] = ode45(f, slot, init);
plot(x, u, 'r')
hold on
plot(x, g(x), 'g');
hold on
plot(x1, u1, 'b');
legend('Eulero', 'Sol. Esatta', 'Ode45');
title('h=0.5');

subplot(2,2,2)
[x, u]=eulero(f, slot, init, 1);
[x1, u1] = ode45(f, slot, init);
plot(x, u, 'r')
hold on
plot(x, g(x), 'g');
hold on
plot(x1, u1, 'b');
legend('Eulero', 'Sol. Esatta', 'Ode45');
title('h=1');

subplot(2,2,3)
[x, u]=eulero(f, slot, init, 0.7);
[x1, u1] = ode45(f, slot, init);
plot(x, u, 'r')
hold on
plot(x, g(x), 'g');
hold on
plot(x1, u1, 'b');
legend('Eulero', 'Sol. Esatta', 'Ode45');
title('h=0.7');

subplot(2,2,4)
[x, u]=eulero(f, slot, init, 0.1);
[x1, u1] = ode45(f, slot, init);
plot(x, u, 'r')
hold on
plot(x, g(x), 'g');
hold on
plot(x1, u1, 'b');
legend('Eulero', 'Sol. Esatta', 'Ode45');
title('h=0.1');

