function eser2_1

slot=[1,2];
init=1;
odefun=@(x,y) -(2*y+x^2*y^2)/x;
h=1/11;
[x,u]=eulero(odefun, slot, init, h);
plot(x,u,'r')