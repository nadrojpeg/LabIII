function G2(M)
    [~, n, ~] = size(M);
    I = zeros(n, 1);
    for i=1:n
        I(i) = tan((i-n/2)*(pi/n));
    end
    I = (n/2)*(I);
    I = round(I)+ones(n,1);
    for i=90:n-90
        A(:,i,:) = M(:,n/2+I(i),:);
    end
    %dato che nei bordi dell'immagine la tangente tende
    %ad infinito, consideriamo l'immagine escludendo
    %una parte dell'immagine
    A = A(:,90:end,:);
    image(A);
end