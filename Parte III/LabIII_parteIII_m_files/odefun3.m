f=@(t, y) [0.405*y(1)-0.81*y(1)*y(2); -1.5*y(2)+0.125*y(1)*y(2)];
[t, u]= ode45(f, [0, 10], [7.7; 0.5]);
plot(u(:,1), u(:,2), 'b');
title('Predatori in funzione delle prede con T=10');

figure
hold on
[t, u]= ode45(f, [0, 25], [7.7; 0.5]);
plot(t, u(:,1), 'r');
plot(t, u(:,2), 'b');
legend('prede', 'predatori');
title('Prede e predatori con T=25');
