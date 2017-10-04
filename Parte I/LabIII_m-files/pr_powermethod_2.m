function [pr]=pr_powermethod_2(A, alpha)
% A: matrice di adiacenza di un grafo
% alpha: parametro di teletrasporto
% pr: vettore di PageRank
[n,m]=size(A);
somma = sum(A, 2);
B = find(somma==0);
somma(B) = 1;
C = spdiags(1./somma, 0, n, n);
D = C*A;

i = 1;
pr = rand(n, 1);
pr = pr/norm(pr, 1);
p = zeros(n, 1);
while((i<100) && (norm(pr-p)>10^(-7)))
    p = pr;
    pr = P_times_x(D, pr, alpha);
    error(i) = norm(pr-p);
    i = i+1;
endwhile

endfunction