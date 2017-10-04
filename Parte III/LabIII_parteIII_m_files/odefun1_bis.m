g1=0.21827;
k1=13;
h1=3.71429;
g2=0.06069;
k2=5.8;
h2=13.2118;
f=zeros(2, 1);
f=@(t, y) [g1*(1-y(1)/k1-y(2)/h1)*y(1);g2*(1-y(2)/k2-y(1)/h2)*y(2)];
slot=[0, 300];
init1=[0.5; 0.5];
init2=[0.1; 0.5];
init3=[10;0.5];

subplot(3, 1, 1)
[t, u]=ode45(f, slot, init1);
hold on
plot(t, u(:,1), 'r');
plot(t, u(:,2), 'b');
legend('Saccharomyces cerevisiae', 'Schizosaccharomyces kephir');
title('N1(0)=0.5');

subplot(3, 1, 2)
[t, u]=ode45(f, slot, init2);
hold on
plot(t, u(:,1), 'r');
plot(t, u(:,2), 'b');
legend('Saccharomyces cerevisiae', 'Schizosaccharomyces kephir');
title('N1(0)=0.1');

subplot(3, 1, 3)
[t, u]=ode45(f, slot, init3);
hold on
plot(t, u(:,1), 'r');
plot(t, u(:,2), 'b');
legend('Saccharomyces cerevisiae', 'Schizosaccharomyces kephir');
title('N1(0)=10');