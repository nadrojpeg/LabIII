function [p,r,p_media,r_media]=accuracy_2(A,B)
j=0;
[m,~]=size(B);
for i=1:m
    if norm(B(i,:))~=0
        j=j+1;
        items_list=recommend(A,i);
        [p(j),r(j)]=accuracy(B,items_list,i);
    end
end

p_media=sum(p)/j;
r_media=sum(r)/j;