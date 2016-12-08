function [c,ceq]=constraintsSH(x)

coeff1=[-3.5448,0,0,0,0,0];
coeff1(2:6)=x(1:5);
coeff2=[-3.5448,0,0,0,0,0];
coeff2(2:6)=x(6:10);
        
c(1) = -minval(coeff1);
c(2) = -minval(coeff2);
ceq = [];

end