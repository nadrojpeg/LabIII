function primi = crivello(n)
%funzione che restituisce un vettore,  
%costruito tramite il crivello di Eratostene,
%che contiene un 1 nelle posizioni prime
%ed uno zero nelle posizioni non prime
	primi = ones(1,n);
	m = round(sqrt(n));
	primi(1) = 0;
	for i = 2 : m
		primi(2*i:i:n) = 0;
	end
end
