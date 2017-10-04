function [y]=P_times_x(P, x, alpha)
% P: matrice ottenuta dalla matrice di adiacenza
% scalando le righe per l'outdegree
% alpha: parametro di teletrasporto
% x: vettore
[m,n]=size(P);
e=ones(n,1);
v=e/n;
y=(1-alpha)*P'*x;
gamma = 1-norm(y,1);
y=y+gamma*v;