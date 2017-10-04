function [p,r,p_media,r_media]=accuracy_3(A,B,k)
j=0;
[n,m]=size(B);
C=pure_svd(A,k);
U=recommend_svd(A,C);
for i=1:n
    if norm(B(i,:))~=0
        j=j+1;
        [p(j),r(j)]=accuracy(B,U(i,:),i);
    end
end
p_media=sum(p)/j;
r_media=sum(r)/j;