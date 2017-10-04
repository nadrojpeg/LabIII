function B=arnold_cat(A,k)
s=size(A);
B=A;
for h=1:k
  for i=0:s(1)-1
    for j=0:s(2)-1
      ip = mod(2*i+j,s(1));
      jp = mod(i+j,s(2));
      B(ip+1,jp+1,:) = A(i+1,j+1,:);
    end
  end
  A = B;
end
imshow(B)
end