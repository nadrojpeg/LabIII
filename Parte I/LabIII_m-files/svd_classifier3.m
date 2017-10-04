function [class]=svd_classifier3(TrainingSet, DigitsTraining, TestSet, h)


% TrainingSet: una matrice nxm contente m immagini vettorizzate su n componenti
% DigitsTraining: vettore di m componenti che riporta la cifra rappresentata
% di ogni immagine in TraininSet
% TestSet: matrice di immagini da classificare
% h :intero
% class: vettore contente la classificazione delle cifre nel TestSet

%contatore occorrenze di ogni cifra
cont=zeros(1,10);
for i=1:1707
    cont(DigitsTraining(i)+1)=cont(DigitsTraining(i)+1)+1;
end
%ordiniamo la matrice TrainingSet in base all'ordine di DigitsTest
[n,m]=size(TrainingSet);
M=TrainingSet';
M(:,n+1)=DigitsTraining;
B=sortrows(M,n+1);
B(:,end)=[];
M=B';
%calcolo dell'SVD degli A_i, plot degli U_i
%creazione matrice BigU
x=0;
y=cont(1);
BigU=zeros(256,10*h);
for i=1:10
    [U,S,V]=svd(M(:,x+1:y));
    if i<10
        x=y;
        y=y+cont(i+1);
    end
    if i~=6
        BigU(:,(i-1)*h+1:i*h)=U(:,1:h);
    else
        BigU(:,(i-1)*h+1:i*h)=[U(:,1:4),BigU(:,(i-1)*h+1+4:i*h)];
end

v=zeros(1,10);
for i=1:2007
    for k=1:10
        if k~=6
            v(k)=norm(((eye(256)-(BigU(:,(k-1)*h+1:k*h))*(BigU(:,(k-1)*h+1:k*h))')*TestSet(:,i)));
        else
            v(k)=norm(((eye(256)-(BigU(:,(k-1)*h+1:(k-1)*h+1+4))*(BigU(:,(k-1)*h+1:(k-1)*h+1+4))')*TestSet(:,i)));
        end
    end
    for k=1:10
        if v(k)==min(v)
            class(i)=k-1;
        end
    end
    v=zeros(1,10);
end
end