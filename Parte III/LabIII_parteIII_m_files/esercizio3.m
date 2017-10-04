mu = [0.1, 1, 10, 100];
slot = [0, 100];
init = [1, 1];

for i=1:4
    f=@(t, y) [y(2); mu(i)*(1-y(1).^2).*y(2)-y(1)];
    
    [t1, y1]=ode45(f, slot, init);
    [t2, y2]=ode15s(f, slot, init);
    [t3, y3]=eulero_esplicito(f, slot, init, 0.01);
    
    figure;
    subplot(2, 3, 1)
    plot(t1, y1(:, 1), 'r');
    legend('ode45');
    subplot(2, 3, 2)
    plot(t2, y2(:, 1), 'r');
    legend('ode15s');
    subplot(2, 3, 3)
    plot(t3, y3(:, 1), 'r');
    legend('eulero_esplicito');
    subplot(2, 3, 4)
    plot(y1(:, 1),y1(:,2) ,'r');
    legend('ode45');
    subplot(2, 3, 5)
    plot(y2(:, 1),y2(:,2) ,'r');
    legend('ode15s');
    subplot(2, 3, 6)
    plot(y3(:, 1),y3(:,2) ,'r');
    legend('eulero_esplicito');
    
    length(t1)
    length(t2)
    length(t3)

end
    
    
    
