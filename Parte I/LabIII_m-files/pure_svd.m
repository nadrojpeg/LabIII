function [C]=pure_svd(A, k)}
% A: matrice user-items
% C: matrice user_items

[m,n]=size(A);
A_mean=transform(A);
X=A;
C=zeros(m,n);
%calcolo l'approssimazione di rango k di A_mean con la svd
[S,V,D]=svds(A_mean,k);
M=S*V*D';
for i=1:m
    for j=1:n
        if X(i,j)==0
            X(i,j)=M(i,j);
        end
        if X(i,j)<=0
            C(i,j)=0;
        elseif 0<X(i,j)<5
            C(i,j)=round(X(i,j));
        else
            C(i,j)=5;
        end
    end
end