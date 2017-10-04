function A=newton_D1_vett(x_0,y_0,m,l)
%funzione che costruisce l'immagine di centro x_0+I*y_0
%di semilato l e con (2*m+1)x(2*m+1) punti
I=sqrt(-1);
maxiteration=100;
h=l/m;
Z = (x_0+I*y_0)+(h*ones(2*m+1,1)*[-m:m]-I*h*[-m:m]'*ones(1,2*m+1));
r=roots([1,0,10000,-200,1]);
A=zeros(2*m+1,2*m+1,3);
CONT=zeros(2*m+1);
%calcoliamo la trasformazione di Z con il metodo di Newton
%e salviamo nella matrice CONT il numero di iterazioni necessarie
%a far si che sul pixel (i,j) sia verificata la condizione 
%richiesta
for k = 1:maxiteration
Z = Z-(Z.^4+(100*Z-1).^2)./(4*Z.^3+20000*Z-200);
CONT=CONT+abs(abs(Z-r(1))<1.e-04*abs(r(1)))+...
+abs(abs(Z-r(2))<1.e-04*abs(r(2)))+...
+abs(abs(Z-r(3))<1.e-04*abs(r(3)))+...
+abs(abs(Z-r(4))<1.e-04*abs(r(4)));
end
%dividiamo punto a punto i pixel dell'immagine per il relativo 
%valore in CONT
CONT=(maxiteration+1)*ones(2*m+1)-CONT;
A(:,:,1) = (abs(abs(Z-r(1)) < 1.e-4*abs(r(1)))+...
+abs(abs(Z-r(4)) < 1.e-4*abs(r(4))))./CONT;
A(:,:,2) = (abs(abs(Z-r(2)) < 1.e-4*abs(r(2)))+...
+abs(abs(Z-r(4)) < 1.e-4*abs(r(4))))./CONT;
A(:,:,3) = (abs(abs(Z-r(3)) < 1.e-4*abs(r(3))))./CONT;
%normalizziamo gli elementi della matrice, in modo da
%assegnare al punto di valore maggiore la luminosità massima
A=A./max(max(max(A)));
%imshow(A);
endfunction
