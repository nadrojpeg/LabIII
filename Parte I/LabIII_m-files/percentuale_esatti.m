function percentuale_esatti(DigitsTest, DigitsTraining, TestSet, TrainingSet)
percentuale=zeros(1,16);
a=1;
for h=5:20
    y=svd_classifier2(TrainingSet, DigitsTraining, TestSet, h)-DigitsTest;
    esatti=2007-nnz(y);
    percentuale(a)=esatti/2007*100;
    a=a+1;
end
axis('equal')
plot([5:20],percentuale, '*b')