function [l,x,perm]=Fiedler_vector(A)
% A matrice di Adiacenza di un grafo
% x è il vettore di Fiedler
% l è il secondo autovalore più piccolo di L
% perm è la permutazione indotta dall'ordinamento di x per valori crescenti

L=graph_laplacian(A); %Calcolo il Laplaciano di A con la funzione graph_laplacian
[V,D]=eigs(L,2,'SM'); %Con la funzione eigs calcolo autovalore ed autovettore di Fiedler
l=D(1,1);
x=V(:,1);
[y,perm]=sort(x);     %Con la funzione sort calcolo la permutazione che ordina x
B=A(perm, perm);      %Riordino A in base alla permutazione perm
spy(B);
[C,d]=spdiags(B);     %Con la funzione spdiags calcolo l'ampiezza di banda di B e di A
band_temp=size(d);
band1=band_temp(1);
[C,d]=spdiags(A);
band_temp=size(d);
band2=band_temp(1);
if band1<band2        %Verifico se la banda di B è minore di quella di A
    disp('La banda di B è minore di quella di A.')
end