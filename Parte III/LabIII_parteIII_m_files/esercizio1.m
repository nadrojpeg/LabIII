g = 9.81;
m=1;
F = [0, 0, -g*m];
span = [0, 10];
init = [0, 1, 0, 0.8, 0, 1.2];
h = [0.0025, 0.00025, 0.005, 0.0005];

%la funzione per risolvere il sistema differenziale
f = @(t, y) [y(4);...
             y(5);...
             y(6);...
             1/m*(-(m*2*(y(4)^2+y(5)^2+y(6)^2) ...
             -2*y(3)*g*m)/(4*(y(1)^2 + y(2)^2 + y(3)^2))*2*y(1));
             1/m*(-(m*2*(y(4)^2 + y(5)^2 + y(6)^2) ...
             - 2*y(3)*g*m)/(4*(y(1)^2 + y(2)^2 + y(3)^2))*2*y(2));
             1/m*(-m*g-(m*2*(y(4)^2 + y(5)^2 + y(6)^2) ...
             - 2*y(3)*g*m)/(4*(y(1)^2 + y(2)^2 + y(3)^2))*2*y(3))];

%metodo di Eulero con h=0.0025 e h=0.00025             
[t, u] = eulero_esplicito(f, span, init, h(1));
max_residuo = max(abs(u(:,1).^2 + u(:,2).^2 + u(:,3).^2-1))

[t, u] = eulero_esplicito(f, span, init, h(2));
max_residuo = max(abs(u(:,1).^2 + u(:,2).^2 + u(:,3).^2-1))

%metodo di Runge_Kutta con h=0.005 e h=0.0005
[t, u] = RK4(f, span, init, h(3));
max_residuo = max(abs(u(1, :).^2 + u(2, :).^2 + u(3, :).^2-1))

[t, u] = RK4(f, span, init, h(3));
max_residuo = max(abs(u(1, :).^2 + u(2, :).^2 + u(3, :).^2-1))
plot3(u(1, :), u(2, :), u(3, :));

%funzione ode23
[t, u] = ode23(f, span, init);
max_residuo = max(abs(u(:, 1).^2 + u(:, 2).^2 + u(:, 3).^2-1))

%funzione ode45 con diversi valori di Reltol
reltol = [0.001,0.0001,0.00001];

[x, u] = ode45(f, span, init, odeset('RelTol', reltol(1)));
max_residuo = max(abs(u(:, 1).^2 + u(:, 2).^2 + u(:, 3).^2-1))

[x, u] = ode45(f, span, init, odeset('RelTol', reltol(2)));
max_residuo = max(abs(u(:, 1).^2 + u(:, 2).^2 + u(:, 3).^2-1))

[x, u] = ode45(f, span, init, odeset('RelTol', reltol(3)));
max_residuo = max(abs(u(:, 1).^2 + u(:, 2).^2 + u(:, 3).^2-1))

