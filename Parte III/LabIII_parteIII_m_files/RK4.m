function [x,u] = RK4(odefun,tspan,y0,h)
% Risolve sull'intervallo [tspan(1),tspan(2)] il problema a valori iniziali:
%   y'(x) = odefun(x,y(x))
%   y(tspan(1)) = y0
% usando il metodo di Runge-Kutta classico
%
% Dati di INPUT:
%   odefun    funzione da integrare inizializzata VETTORIALMENTE
%   tspan     intervallo di integrazione
%   y0        condizione iniziale PER COLONNA
%   h         passo di discretizzazione
%
% Dati di OUTPUT:
%   x       nodi equispaziati della griglia
%   u       soluzione numerica in corrispondenza dei nodi

x = [tspan(1):h:tspan(2)];
N = length(x);
ord = length(y0);
u = zeros(ord, N);  
u(:, 1) = y0;
for i = 2:N
    f(:, 1) = odefun(x(i-1),u(:, i-1));
    f(:, 2) = odefun(x(i-1)+h/2,u(:, i-1)+h*f(:, 1)/2);
    f(:, 3) = odefun(x(i-1)+h/2, u(:, i-1)+h*f(:, 2)/2);
    f(:, 4) = odefun(x(i-1)+h, u(:, i-1)+h*f(:, 3));
    u(:, i) = u(:, i-1)+h/6*(f(:, 1)+2*f(:, 2)+2*f(:, 3)+f(:, 4));
end
end