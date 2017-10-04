function precision_test(class, DigitsTest)
cont=0;
for i=1:2007
    if class(i)==DigitsTest(i)
        cont=cont+1;
    end
end
precisione=(cont/2007)*100