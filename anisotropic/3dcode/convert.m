function val=convert(data,t,u0,x)%switches to one vector instead of two
coeff1=[-3.5448,0,0,0,0,0];
coeff1(2:6)=x(1:5);
coeff2=[-3.5448,0,0,0,0,0];
coeff2(2:6)=x(6:10);
val = intsymdif(data,t,u0,coeff1,coeff2);