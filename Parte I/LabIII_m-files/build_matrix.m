function Phat=build_matrix(A, alpha)
% A: matrice di adiacenza di un grafo
% alpha: parametro di "teletrasporto" valore tipico 0.15
% Phat=(1-alpha)*Pbar+\alpha evT

[n,m]=size(A);
e=ones(n,1);
d=zeros(n,1);
v=e/n;
outdegree=A*ones(m, 1);
for i=1:n
    if outdegree(i)==0
        P(i,:)=A(i,:);
    else
        P(i, :)=A(i, :)/outdegree(i);
    end
end
for i=1:n
    if outdegree(i)==0
        d(i)=1;
    else
        d(i)=0;
    end
end
Pbar=P+d*v';
Phat=(1-alpha)*Pbar+alpha*e*v';