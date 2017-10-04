function L=graph_laplacian(A)
%A e' la matrice di adiacenza di un grafo non orientato
%L e' la matrice Laplaciana del grafo descritto da A
d=size(A);
a=ones(d(1),1);
L=spdiags(A*a,0,d(1),d(1))-A;