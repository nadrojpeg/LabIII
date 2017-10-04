function [p, r]=accuracy(B, item_list, user)
% B: matrice user-items (test-set)
% item_list: insieme di indici
% user: identificativo di un utente
% p: valore di precision
% r: valore di relall

[n,m]=size(B);
tp=0;
fp=0;
fn=0;
for j=1:m
    if (items_list(j)>0) && (B(user,j)>=4)
        tp=tp+1;
    elseif (items_list(j)>0) && (0<B(user,j)<4)
        fp=fp+1;
    elseif (items_list(j)==0) && (B(user,j)>=4)
        fn=fn+1;
    end
end
p=tp/(tp+fp);
r=tp/(tp+fn);