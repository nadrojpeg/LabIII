function [a, b, c, d] = confronto_tempi(A)

disp('powermethod con alpha=0.15')
tic;
a=pr_powermethod_2(A,0.15);
toc;

disp('pagerank_eigs con alpha=0.15')
tic;
b=pagerank_eigs(A,0.15);
toc;

figure(1);
plot(a - b, 'b');

disp('powermethod con alpha=0.01')
tic;
c=pr_powermethod_2(A,0.01);
toc;
plot(c, 'r')

disp('pagerank_eigs con alpha=0.01')
tic;
d=pagerank_eigs(A,0.01);
toc;

figure(2);
plot(c - d, 'b');

end