function [b] = L6(a)
% applichiamo il filtro 
% dell'esercizio L6 
% all'immagine salvata in a
s=size(a);
m=s(1);
n=s(2);
k=floor(m/2);
u=[1:k];
f=(1-cos((3*pi/2)+(2*pi/m)*u)).^3;
if (mod(m,2)==0)
    f1=[1,f,f(k-1:-1:1)];
else
    f1=[1,f,f(k:-1:1)];
end

k=floor(n/2);
u=[1:k];
f=(1-cos((3*pi/2)+(2*pi/n)*u)).^3;
if (mod(n,2)==0)
    f2=[1,f,f(k-1:-1:1)];
else
    f2=[1,f,f(k:-1:1)];
end
b = double(a);
for i=1:3
    v = fft2(double(a(:,:,i)));
    v = diag(f1)*v*diag(f2);
    v=ifft2(v);
    b(:,:,i)=real(v);
end
mx=max(max(max(b)));
fattore = 250.0/mx;
b = b*fattore;
b = uint8(b);
% imshow(b);
end
