function [items_list]=recommend(A, user)
% A: matrice dei rating utenti − items
% user: indice di un utente
% items_list: insieme di indici di item da raccomandare a user

[m,n]=size(A);
[S_user,~]=similarity(A);
items_list=zeros(1,n);
[~,I]=sort(S_user(user,:),'descend');
i_max=I(2);
for j=1:n
    if ((A(user,j)==0) && ((A(i_max,j)==4) || (A(i_max,j)==5)))
        items_list(j)=1;
    end
end