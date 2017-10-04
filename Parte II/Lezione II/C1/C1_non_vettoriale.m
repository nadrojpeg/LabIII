function C1_non_vettoriale(n)
%Evidenziare le coppie di numeri interi (p,q) 
% tali che p^2+q^2 è primo

A=zeros(n);
%controlliamo tramite la funzione isprime
%se i^2+j^2 è primo
for i=1:n
    for j=1:n
        imag(i,j)=isprime(i^2+j^2);
    end
end
%mostriamo in nero i punti (p,q)
%che soddisfano l'ipotesi
imshow(1+imag, [1 1 1; 0 0 0]);
end