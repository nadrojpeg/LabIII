 function [x]=solve_augmented(M,b)
    % USO: x=solve_augmented(M, b),
    % M matrice di incidenza di un grafo,
    % b vettore dei termini noti del sistema lineare Lx=b
    [n,m]=size(M);
    B=sparse([eye(m) M';M zeros(n)]); %B deve essere sparsa
    [Q,R,P]=qr(B); %utilizziamo il metodo qr con pivot sulle
    % colonne per calcolare una fattorizzazione
    % "rank-revealing" cioe’ dove le ultime t righe di R sono nulle
    % se rank(R)=n-t;
    c1=rand(m,1);
    c2=M*c1-b;
    c=[c1;c2];
    z=Q\c; %soluzione del sistema Qz=c
    soglia=0.0000000001;
    r=sum(abs(diag(R))>soglia); % rango di R.. attenzione si opera in aritmetica finita...
    if abs(z(r+1:n+m))>10^-12*norm(z) || r==n+m
    %controlla che z(r+1:n+m)==0 e che R sia singolare
    error('qualcosa va male, vettore b non adeguato?');
    end
    R1=R(1:r,1:r); %minore principale di testa di R di rango pieno
    z1=z(1:r);
    V1=R(1:r,r+1:end); %prime r righe delle ultime colonne della matrice R
    alpha=ones(1,n+m-r); % vettore qualsiasi di dimensioni opportune...
    w1=R1\(z1-V1*alpha);
    w=[w1;alpha];
    y=P*w; % occorre permutare le componenti di w
    x=y(m+1:end);
    % verifica che x sia soluzione di Lx=b
    end