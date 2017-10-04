function B=F(A,k)
[m,n,s]=size(A);
B=A;
M1=[1 1; 0 1];
M2=[1 -1; 0 1];
M3=[1 0;1 1];
M4=[1 0;-1 1];
S=[kron(ones(1,n),[0:m-1]);kron([0:n-1],ones(1,m))];
T=S;
for i=1:k
      if mod(i,2)==1
        v_t=abs(T(2,:)<=(n/2));
        M=[v_t;v_t];
        T=M1*(T.*M)+M2*(T.*(1-M))+[n;0].*(1-M);
      else
        v_t=abs(T(1,:)<=(n/2));
        M=[v_t;v_t];
        T=M3*(T.*M)+M4*(T.*(1-M))+[0;n].*(1-M);
      endif
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
