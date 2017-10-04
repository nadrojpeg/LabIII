function x=solve_augmented(M,b)

	[n,m]=size(M);
	I=[];
	J=[];
	s=[];
	for i=1:n
		for j=1:m
			I=[I,m+i,j];
			J=[J,j,m+i];
			s=[s,M(i,j),M(i,j)];
		end
	end
	for j=1:m
		I=[I,j];
		J=[J,j];
		s=[s,1];
	end
	B=sparse(I,J,s,m+n,m+n);
	h=zeros(1,m);
	c=[h,b.*(-1)];
	[Q,R,P]=qr(B);
	z=(Q'*c')';
	%Risolvere Rw=z
	soglia=0.0000000001; 
	r=sum(abs(diag(R))>soglia);
	%if abs(z(r+1:n+m))>eps*norm(z)
	%	error('qualcosa va male, vettore b non adeguato?');
	%end
	%if r==n+m
	%	error('qualcosa va male, vettore b non adeguato?');
	%end
	R1=R(1:r,1:r);
	V1=R(1:r,r+1:m+n);
	z1=z(1:r);
	alpha=zeros(1,n+m-r);
	w1=(R1\(z1'-V1*alpha'))';
	w=[w1,alpha];
	%Risolto Rw=z
	y=(P*w')';
	x=y(m+1:m+n);
end
