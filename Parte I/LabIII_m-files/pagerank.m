function [pr]=pagerank(A, alpha)
% A: matrice di adiacenza di un grafo
% alpha: parametro di teletrasporto valore tipico 0.15
% pr: vettore di pageRank costruito come l'autovettore sinistro
% di Phat relativo a lambda=1
Phat=build_matrix(A, alpha);
[V,D]=eigs(Phat',1);
pr=V';