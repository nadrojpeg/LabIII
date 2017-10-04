function ese1_s 

slot=[0,6];
h=0.1;
init=1000;
odefun=@(x,y)(log(2)*y);
[x,u] = eulero(odefun,slot,init,h);
plot(x,u,'r')