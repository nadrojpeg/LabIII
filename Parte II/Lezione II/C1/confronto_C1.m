function confronto_C1(n)
%funzione che confronta i tempi di esecuzione
%delle due versioni di C1
disp('Tempo di esecuzione della versione C1 non vettoriale')
tic
C1_non_vettoriale(n);
toc
disp('Tempo di calcolo della funzione C1 vettoriale')
tic
C1_vettoriale(500);
toc
end