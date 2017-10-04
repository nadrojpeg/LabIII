function [pr]=pagerank_eigs(A,alpha)

n=size(A, 1);
somma = sum(A, 2);
B = find(somma==0);
somma(B) = 1;
C = spdiags(1./somma, 0, n, n);
D = C*A;

y=@(x) P_times_x_norm(D, x, alpha);
[pr,~]=eigs(y, n, 1);

end