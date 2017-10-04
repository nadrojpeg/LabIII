function [class]=mean_classifier(TrainingSet, DigitsTraining, TestSet)
% TrainingSet: una matrice mxn contente m immagini vettorizzate su n componenti
% DigitsTraining: vettore di n componenti che riporta la cifra rappresentata
% di ogni immagine in TraininSet
% TestSet: matrice di immagini da classificare
% class: vettore che conterraâ?? la classificazione delle cifre nel TestSet
M=zeros(256,10);
cont=zeros(1,10);
for i=1:1707
    cont(DigitsTraining(i)+1)=cont(DigitsTraining(i)+1)+1;
    M(:,DigitsTraining(i)+1)=M(:,DigitsTraining(i)+1)+TrainingSet(:,i);
end
for i=1:10
    M(:,i)=M(:,i)/cont(i);
end
for c=1:10
     subplot(2, 5, c)
     ima2(M(:, c))
end
for i=1:2007
    v=zeros(1,10);
    for k=1:10
        v(k)=norm(TestSet(:,i)-M(:,k));
    end
    for j=1:10
        if v(j)==min(v)
            class(i)=j-1;
        end
    end
end