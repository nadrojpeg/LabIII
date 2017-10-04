function [S_user, S_items]=similarity(A)
% A; matrice dei rating utenti-items
% S_user: matrice di similarita’ (misura del coseno) tra ogni coppia
% di utenti di A
% S_items; matrice di similarita’ (misura del coseno) tra ogni coppia
% di items di A

[m,n]=size(A);
B=A;
S_user=zeros(m,m);
S_items=zeros(n,n);
%costruiamo la matrice S_user
for p=1:m
    B(p,:)=B(p,:)/norm(B(p,:));
end
for i=1:m
    for j=1:m
        S_user(i,j)=B(i,:)*B(j,:)';
    end
end
%costruiamo la matrice S_items
B=A;
for q=1:n
    B(:,q)=B(:,q)/norm(B(:,q));
end
for i=1:n
    for j=1:n
        S_items(i,j)=C(:,i)'*C(:,j);
    end
end