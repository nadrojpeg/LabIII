function [U]=recommend_svd(A,C)
% A: matrice user − item
% C: matrice user − item ottenuta con la funzione pure_svd
% U: matrice user − item binaria

[m,n]=size(A);
U=zeros(m,n);
for i=1:m
    for j=1:n
        if (A(i,j)==0) && (C(i,j)>=4)
            U(i,j)=1;
        end
    end
end