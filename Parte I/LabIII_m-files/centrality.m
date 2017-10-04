function [hc, ac]=centrality(A)
% A : matrice di adiacenza
% hc: misura di centralita’ come hub
% ac: misura di centralita’ come authority

[n,m]=size(A);
B=[zeros(n,n), A; A', zeros(n,n)];
E=expm(B);
hc=diag(E(1:n,1:n));
ac=diag(E(n+1:2*n,n+1:2*n));