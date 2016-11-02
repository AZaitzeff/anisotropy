function [coeff]= boundsSH(coeff)
if coeff(2)>0
    coeff(2)=0;
end
if coeff(3)>0
    coeff(3)=0;
end
if coeff(5)>0
    coeff(5)=0;
end

if coeff(4)>1.58
    coeff(4)=1.58;
end

if coeff(4)<-3.17
    coeff(4)=-3.17;
end

if coeff(6)>1.8305
    coeff(6)=1.8305;
end

if coeff(6)<-1.8305
    coeff(6)=-1.8305;
end

if coeff(4)<0
    val=.3154*abs(coeff(4))+.5463*abs(coeff(6));
    if val>1
       coeff(6)=coeff(6)/val;
       coeff(4)=coeff(4)/val; 
    end

end
