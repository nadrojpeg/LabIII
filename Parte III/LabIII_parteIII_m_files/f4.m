function yp = f4(x,y)
    yp = zeros(2,1);
    yp(1) = y(2);
    yp(2) = -9.8/2*y(1);
end
