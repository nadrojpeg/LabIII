function media_LSI(A,Q,M)
PM=zeros(1,4);
RM=zeros(1,4);
epsilon=0.01;
j=1;
for k=25:25:100
    Pm=0;
    Rm=0;
    for i=1:30
        vc=LSI(A, Q(:,i), k);
        [P, R]=precision_recall(vc, i, epsilon, M);
        Pm=Pm+P;
        Rm=Rm+R;
    end
    PM(j)=Pm/30;
    RM(j)=Rm/30;
    j=j+1;
end
x=25:25:100;
plot(x,PM,'or')
hold on
plot(x,RM,'ob')
    