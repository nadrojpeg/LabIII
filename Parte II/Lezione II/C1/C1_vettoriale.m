function C1_vettoriale(n)
%versione vettoriale, decisamente più performante,
%della funzione C1
A=zeros(n);
a=[1:n]';
a=a.^2;
%creiamo la matrice che ha al posto
%(i,j) il numero (i^2+j^2)
A=a*ones(1,n)+ones(n,1)*a';
%tramite il crivello di eratostene
%vediamo quali elementi sono primi
c=crivello(2*n^2);
z=c(A);
%stampiamo i numeri primi in nero
imshow(1+z, [1 1 1; 0 0 0]);
end