function pageplot(A)
hold on
alpha=[0.15, 0.1, 0.01, 10^-8, 10^-12];
plot(pagerank(A,alpha(1)),'y');
plot(pagerank(A,alpha(2)),'m');
plot(pagerank(A,alpha(3)),'c');
plot(pagerank(A,alpha(4)),'r');
plot(pagerank(A,alpha(5)),'g');
