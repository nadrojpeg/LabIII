function [B] = M6(A)

[m, n, ~] = size(A);
B = 9*A;
B(1:m-1,:,:) = B(1:m-1,:,:)-A(2:m,:,:); 
B(2:m,:,:) = B(2:m,:,:)-A(1:m-1,:,:);
B(:,1:n-1,:) = B(:,1:n-1,:)-A(:,2:n,:);
B(:,2:n,:) = B(:,2:n,:)-A(:,1:n-1,:);
B(1:m-1,1:n-1,:) = B(1:m-1,1:n-1,:)+A(2:m,2:n,:);
B(1:m-1,2:n,:) = B(1:m-1,2:n,:)+A(2:m,1:n-1,:);
B(2:m,2:n,:) = B(2:m,2:n,:)+A(1:m-1,1:n-1,:);
B(2:m,1:n-1,:) = B(2:m,1:n-1,:)+A(1:m-1,2:n,:);

end