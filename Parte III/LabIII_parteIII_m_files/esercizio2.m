s = 10;
r = 28;
b = 8/3;
init1 = [10, 0, 20];
init2 = [11, 0, 20];
xmax = 30;

%funzione di Lorenz
f=@(t, y) [s*(y(2)-y(1)); r*y(1)-y(2)-y(1)*y(3); y(1)*y(2)-b*y(3)];

%risolviamo con i valori iniziali init1
[t, y] = ode45(f, [0, xmax], init1);
figure;
subplot(3, 1, 1);
plot(t, y(:, 1));
legend('y1');
subplot(3, 1, 2);
plot(t, y(:, 2));
legend('y2');
subplot(3, 1, 3);
plot(t, y(:, 3));
legend('y3');

figure;
plot3(y(:,1), y(:,2), y(:,3));
title('y1, y2, y3');

%risolviamo con i valori iniziali init2
[t, y] = ode45(f, [0, xmax], init2);
figure;
subplot(3, 1, 1);
plot(t, y(:, 1));
legend('y1');
subplot(3, 1, 2);
plot(t, y(:, 2));
legend('y2');
subplot(3, 1, 3);
plot(t, y(:, 3));
legend('y3');

figure;
plot3(y(:,1), y(:,2), y(:,3));
title('y1, y2, y3');


