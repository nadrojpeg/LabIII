function mandelbrot_E0(p,l,m)

I = sqrt(-1);
h=l/m;
A = h*ones(2*m+1,1)*[-m:m]-I*h*[-m:m]'*ones(1,2*m+1)+p;
q=63;
cont=zeros(2*m+1);
Z=zeros(2*m+1);
for i=1:q
Z=Z.^2+A;
cont=cont+i*abs(abs(Z)>2);
Z=Z.*abs(cont==0);
A=A.*abs(cont==0);
end
cont=cont+64*abs(cont==0);
colormap('default');
imshow(cont,colormap);
