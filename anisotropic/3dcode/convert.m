function val=convert(data,t,u0,x)
coeff1=[-3.5448,-1,-2,0,-2,-1];
coeff1(2:6)=x(1:5);
%coeff1(3)=x(1);
%coeff1(5)=x(2);
coeff2=[-3.5448,0,-1,-1,-1,0];
coeff2(2:6)=x(6:10);
val = intsymdif(data,t,u0,coeff1,coeff2);