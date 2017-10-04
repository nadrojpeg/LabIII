function B=Arnold_Cat(A,k)
%Arnold cat versione vettoriale che funziona
%su matrici rettangolari
[m,n,s]=size(A);
B=A;
M=[2 1;1 1];
S=[kron(ones(1,n),[0:m-1]);kron([0:n-1],ones(1,m))];
T=S;
for j=1:k
  T=M*T;
  T(1,:)=mod(T(1,:),m);
  T(2,:)=mod(T(2,:),n);
endfor
vt=T(1,:)+1+m*T(2,:);
vt=reshape(vt,[m,n]);
if s==3
  for j=1:3
    F=A(:,:,j);
    F(vt)=F;
    B(:,:,j)=F;
  endfor
else
  B(vt)=A;
endif
imshow(B)
endfunction
  
  
