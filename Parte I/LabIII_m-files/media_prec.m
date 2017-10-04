function media_prec(A,Q,M)
PM=zeros(1,10);
RM=zeros(1,10);
k=1;
for j=0.01:0.01:0.1
    Pm=0;
    Rm=0;
    for i=1:30
        vc=cos_vector(A,Q(:,i));
        [P, R]=precision_recall(vc, i, j, M);
        Pm=Pm+P;
        Rm=Rm+R;
    end
    PM(k)=Pm/30;
    RM(k)=Rm/30;
    k=k+1;
end
a=0.01:0.01:0.1;
plot(a,PM,'or')
hold on
plot(a,RM,'ob')