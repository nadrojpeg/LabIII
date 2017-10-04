function plot_pageRank(A)
alpha=[0.15, 0.1, 0.01, 10^-8, 10^-12];
for i=1:5
    pr=pagerank(A, alpha(i));
    hold on
    plot(pr);
end
