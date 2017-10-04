function percent_cifre2(DigitsTest, DigitsTraining, TestSet, TrainingSet)
%contatore occorrenze di ogni cifra
    cont=zeros(1,10);
    for i=1:2007
        cont(DigitsTest(i)+1)=cont(DigitsTest(i)+1)+1;
    end
for h=5:20
    percentuale=zeros(1,10);
    [class]=svd_classifier3(TrainingSet, DigitsTraining, TestSet, h);
    for i=1:2007
        if class(i)==DigitsTest(i)
        percentuale(DigitsTest(i)+1)=percentuale(DigitsTest(i)+1)+1;
        end
    end
    for k=1:10
        percentuale(k)=percentuale(k)/cont(k);
    end
    subplot(4,4,h-4)
    plot(0:9,percentuale,'*b')
    title(h)
end
    