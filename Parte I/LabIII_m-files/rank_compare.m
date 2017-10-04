function [top_idx, pr_idx, auth_idx,C]=rank_compare(A, n)
% A matrice di adiacenza di un grafo
% n: intero positivo
% top_idx: vettore di indici dei primi n nodi ordinati in base
% a somma di indegree e outdegree
% pr_idx: vettore di indici dei primi n nodi ordinati in base a pagerank
% auth_idx:vettore di indici dei primi n nodi ordinati in base
% al punteggio di authority

indegree = sum(A);
outdegree = sum(A');
sumdegree = indegree + outdegree;
[B,I]=sort(sumdegree,'descend'); %ordino il vettore sumdegree
top_idx=I(1:n);
C=A(top_idx,top_idx); %riordino a secondo le prime n componenti di I
pr=pagerank(C,0.15);
[Bpr,Ipr]=sort(pr,'descend');
pr_idx=top_idx(Ipr);
[a,h]=Iterate_HITS(C);
[Bh,Ih]=sort(h,'descend');
auth_idx=top_idx(Ih);