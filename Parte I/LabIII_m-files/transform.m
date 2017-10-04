function [A_mean]=transform(A)}
% A: matrice user-items
% A_mean: marice user_items

[m,n]=size(A);
A_mean=A;
for i=1:m
    mean=mean(A(i,:));
    for j=1:n
        if A_mean(i,j)==0
            A_mean(i,j)=mean;
        end
    end
end