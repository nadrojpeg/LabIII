%x=Y(1);
%y=Y(2);
g1=0.21827;
k1=13;
h1=3.71429;
g2=0.06069;
k2=5.8;
h2=13.2118;
f=zeros(2, 1);
f=@(t, y) [g1*(1-y(1)/k1-y(2)/h1)*y(1);g2*(1-y(2)/k2-y(1)/h2)*y(2)];
slot = [0, 300];
init = [0.5;0.3];
[t, u]=ode45(f, slot, init);
hold on
plot(t, u(:,1), 'r');
plot(t, u(:,2), 'b');
legend('Saccharomyces cerevisiae', 'Schizosaccharomyces kephir');

%f(1)= g1*(1-x/k1-y/h1)*x;
%f(2)=g2*(1-y/k2-x/h2)*y;