function [  ] = testL3(  )
%Funzione test per Lezione 3 su Classificazione
load dataset_digits.mat
[class]=mean_classifier(TrainingSet, DigitsTraining, TestSet);

%conta_occorrenze di ogni cifra nel test set
z=confronta(class, DigitsTest);
freq=sum(z)/length(DigitsTest);
if abs(freq-0.8)>0.01 
    error('Test frequenza failed'),  
else
    disp('Test frequenza passed'); 
end

h=[10:2:20];
soglie=[0.931,0.935, 0.939, 0.938, 0.941];
for i=1:5    
    [class]=svd_classifier(TrainingSet, DigitsTraining, TestSet, h(i) );
    z=confronta(class, DigitsTest);
    freq(i)=sum(z)/length(DigitsTest);
     if abs(freq(i)-soglie(i))>1e-3 
         error('Test frequenza svd failed'),  
    else
         disp('Test frequenza svd passed'); 
    end
end
end

function [ z ] = confronta( x, y )
%confronta due vettori
n=length(x);
z=zeros(n, 1);
for i=1:n
    if x(i)==y(i)
        z(i)=1;
    end
end

end
