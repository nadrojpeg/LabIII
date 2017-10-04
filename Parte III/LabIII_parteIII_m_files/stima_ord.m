function [O]=stima_ord(A)
[n, m]=size(A);
O = zeros(n-1, 2);

for j=1:n-1
    O(j,1)=log2(A(j,2)/A(j+1,2));
    O(j,2)=log2(A(j,3)/A(j+1,3));
end
end