function y = P_times_x_norm(A, x, alpha)

y = norm(x, 1)*P_times_x(A, x/norm(x, 1), alpha);

end