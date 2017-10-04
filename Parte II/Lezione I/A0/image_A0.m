function image_A0(f, n)
%f è la funzione e n è un intero che specifica
%la dimensione dell'immagine

A=zeros(n,n,3);
for i=1:n
    for j=1:n
        if (f(i/n,j/n)>=-1) & (f(i/n,j/n)<-1/3)
            A(i,j,1)=1;
        elseif (f(i/n,j/n)>=-1/3) & (f(i/n,j/n)<1/3)
            A(i,j,2)=1;
        elseif (f(i/n,j/n)>=1/3) & (f(i/n,j/n)<2/3)
            A(i,j,3)=1;
        end
    end
end
image(A)
end
