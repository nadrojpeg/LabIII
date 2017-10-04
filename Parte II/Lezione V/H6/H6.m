function Y = H6(M,lato)
%le immagini sono ottenute con lato = 4
    I = sqrt(-1);
    [m,n,~] = size(M);
    h = lato/m;
    Y = zeros(m,n,3);
    i0 = round(m/2); 
    j0 = round(n/2);
    for ip=1:m
        for jp=1:n
            z = (jp-j0)*h-I*(ip-i0)*h;
            w = f(z);
            i = round(i0-imag(w)/h);
            j = round(j0+real(w)/h);
            if(1<=i && i<=m && 1<=j && j<=n)
                Y(ip,jp,:) = M(i,j,:);
            end
        end
    end
    Y=uint8(Y);
    image(Y);
end