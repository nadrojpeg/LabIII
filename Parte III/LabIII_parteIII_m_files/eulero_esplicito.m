function [x,u] = eulero_esplicito(odefun,slot,init,h)

x=[slot(1):h:slot(2)];
N=length(x);
u = zeros(N, length(init));  
u(1, :) = init;
for i = 2:N
    ff = odefun(x(i-1),u(i-1, :))';
    u(i, :) = u(i-1, :)+h*ff;
end

end