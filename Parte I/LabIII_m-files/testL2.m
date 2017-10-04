function  testL2()
% test di verifica correttezza della soluzione degli esercizi della lezione
% sui grafi
% USO: chiamare testL2() nella directory contenete le funzioni implementate per il primo
% assignment
% NOTA: non funziona con Octave ameno che non si trovino alcune funzini
% come GRAPH e LAPLACIAN
A=sprand(100, 100,0.2);
A=A+A';
A=spones(A);
A=A-diag(diag(A));
[i,j]=find(triu(A, 1));
L=graph_laplacian(A);
G=graph(i, j);
Lg=laplacian(G);
if sum(abs(Lg-L))~=0
    error('Laplacian test failed')
else
    disp('Laplacian test passed');
end   
M=incidence_matrix(A);
if sum(abs(L-M*M'))~=0        
    error('Incidence matrix test failed ');
else
    disp('Incidence matrix test passed');
end      
[l,x,perm]=Fiedler_vector(A);
[lp,up] = bandwidth(A(perm, perm));
bp=max(lp, up);
[la, ua]=bandwidth(A);
ba=max(la, ua);
if bp>=ba
    error('probable error: Fiedler test failed')
else
    disp('Fiedler test passed')
end      
xstar=ones(size(A, 1), 1);
b=L*xstar;
x = solve_augmented( M, b );
if norm(L*x-b)>10^-12
    error('Augmented solution test failed');
else
    disp('Augmented solution test passed');
end    
end    