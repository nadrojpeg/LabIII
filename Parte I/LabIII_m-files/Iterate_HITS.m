function [h, a]=Iterate_HITS(A)
% A matrice di adiacenza di un grafo
% h e a punteggi di Hub e autority

maxiterations=3000;
epsilon=10^-16;

h0=ones(size(A,2),1);
a0=ones(size(A,2),1);
h=A*a0;
a=a0;
B=A';
i=0;
while (norm(h-h0)>epsilon || norm(a-a0)>epsilon) && i<maxiterations
    h0=h;
    a0=a;
    a=B* h0;
    h=A*a;
    h=h/norm(h, 2);
    a=a/norm(a, 2);
    i=i+1;
end