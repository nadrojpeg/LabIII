function [vc]=LSI(A, q, k)
% A: matrice terminixdocumenti
% q: vettore query
% k: intero
% vc: vettore dei coseni

[n,m]=size(A);
for j=1:m
    A(:,j)=A(:,j)/norm(A(:,j));
end
[U,S,V]=svds(A,k);
C=V*(S');
vc=zeros(1,k);
for j=1:k
    vc(j)=(C(j,:)*(U'*q))/(norm(C(j,:))*norm(U'*q));
end