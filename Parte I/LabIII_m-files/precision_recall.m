function [P, R]=precision_recall(vc, query_index, epsilon, M)
% vc vettore dei coseni
% epsilon: threshold
% query_idx: indice di una query in Q_med
% M: matrice che associa ad ogni query_index la lista dei documenti rilevanti
% P: valore di Precision
% R: valore di Recall

[n,m]=size(vc);
pos=zeros(m);
Dt=0;
Dr=0;
Nr=sum(M(query_index,:));

for i=1:m
    if vc(i)>epsilon
        Dt=Dt+1;
        pos(i)=1;
    end
end
a=find(pos);
b=find(M(query_index,:));
inter=intersect(a,b);
Dr=length(inter);
P=Dr/Dt;
R=Dr/Nr;
Dr;
Dt
Nr;
end