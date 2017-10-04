[x,u] = RK4(@(x, y) fun2_2(x, y),[1;2],[1;0],0.01);
plot(x, u(1, :), 'r');
hold on
plot(x, u(2, :), 'b');
legend('y(x)', 'dy(x)/dx');