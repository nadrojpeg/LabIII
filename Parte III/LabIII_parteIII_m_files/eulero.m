function [x,u] = eulero(odefun,slot,init,h)
%Risolve sull'intervallo [slot(1),slot(2)] il problema a valori iniziali:
%y'(x) = odefun(x,y(x))
%y(slot(1)) = y0
%usando il metodo di Eulero
%Dati di INPUT: odefun funzione da integrare, slot intervallo di integrazione
%init condizione iniziale, h passo di integrazione
%Dati di OUTPUT: x nodi equispaziati della griglia, u soluzione numerica in corrispondenza dei nodi

x=[slot(1):h:slot(2)];
N=length(x);
u = zeros(N,1);  
u(1) = init;
for i = 2:N
    ff = odefun(x(i-1),u(i-1));
    u(i) = u(i-1)+h*ff;
end

end

