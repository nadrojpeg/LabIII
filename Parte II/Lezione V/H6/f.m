function w = f(z)
if z ~= 0
    w = z - (z^3-1)/(3*z^2);
else
    w = 0;
end