a=2;
b=0;
g=0.001;
a1=1;
b1=0.001;
f=@(t, y) [(a-b*y(1)-g*y(2))*y(1);(-a1+b1*y(1))*y(2)];
slot=[0, 5];
init1=[300;150];
init2=[15;22];

figure;
[t, u]=RK4(f, slot, init1, 0.01);
hold on
plot(t, u(1,:), 'r');
plot(t, u(2,:), 'b');
legend('preda', 'predatore');
title('preda(0)=300, predatore(0)=150');
figure;
plot(u(1,:), u(2,:), 'g');
title('predatori rispetto alle prede');



figure;
[t, u]=RK4(f, slot, init2, 0.01);
hold on
plot(t, u(1,:), 'r');
plot(t, u(2,:), 'b');
legend('preda', 'predatore');
title('preda(0)=15, predatore(0)=22');
figure;
plot(u(1,:), u(2,:), 'g');
title('predatori rispetto alle prede');