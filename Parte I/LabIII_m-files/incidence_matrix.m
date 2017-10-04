function M=incidence_matrix(A)
% A matrice di adiacenza di un grafo
% M sua matrice di incidenza

%Le diagonali le rendo uguali a zero
%Controlliamo se A è simmetrica
if A==A'
    %Se A è simmetrica consideriamo la sua triangolare superiore
    A1=triu(A)-diag(diag(A)); 
    %numero di elementi di A1 non nulli
    d=size(A);
    count=nnz(A1);
    M=zeros(d(1),count);
    column=1;
    %Creo la matrice M
    for k=1:d(1)
        for j=k:d(1)
            if A1(k,j)~=0
                M(k,column)=1;
                M(j,column)=-1;
                column=column+1;
            end
        end
    end
else
    %Se A non è simmetrica la considero tutta
    A1=A-diag(diag(A));
    d=size(A);
    count=nnz(A1);
    M=zeros(d(1),count);
    column=1;
    %Creo la matrice M
    for k=1:d(1)
        for j=1:d(1)
            if A1(k,j)~=0
                M(k,column)=1;
                M(j,column)=-1;
                column=column+1;
            end
        end
    end
end