function klauber
K=zeros(500,999);
c=crivello(500^2);
    for i=1:500
		K(i,:)=[zeros(1,499-(i-1)), c((i-1)^(2)+1:i^2), zeros(1,499-(i-1))];
    end
imshow(1+K, [1 1 1; 0 0 1]);
end    
