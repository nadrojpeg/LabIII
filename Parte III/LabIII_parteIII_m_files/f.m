function yp = f(x,y)
    yp = zeros(2,1);
    yp(1) = y(2);
    yp(2) = -16.4/90*y(2)-9.8;
end
