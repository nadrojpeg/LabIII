function vc=cos_vector(A, q)
% A: matrice termini-documenti
% q: vettore di query
% vc: vettore, vc(j) memorizza il coseno dell’angolo
% tra la colonna a_j e il vettore q

[m,n]=size(A);
vc=zeros(1,n);
for i=1:n
    vc(i)=(A(:,i)'*q)/(norm(q)*norm(A(:,i)));
end
