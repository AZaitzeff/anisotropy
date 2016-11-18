function [coeff1m,coeff2m,vals,step] = gradientdescK(data,t,nt,dt,u0,coeff10,coeff20)
h=.05;
N=numel(coeff10);
grad=zeros(1,2*N);
A = eye(N); 
coeff1m=zeros(nt,N);
coeff2m=zeros(nt,N);
vals=zeros(nt+1,1);
coeff1=coeff10;
coeff2=coeff20;
tcoeff1=coeff10;
tcoeff2=coeff20;
val=intsymdif(data,t,u0,coeff1,coeff2);
minval=val;
vals(1)=val;
alpha=dt;
tou=.98;
flag=1;
for step=1:nt
    if flag==1;
        for e=2:N
            grad(e)=(intsymdif(data,t,u0,coeff1+A(e,:)*h,coeff2)-val)/h;
        end
        for e=2:N
            grad(e+N)=(intsymdif(data,t,u0,coeff1,coeff2+A(e,:)*h)-val)/h;
        end
    end
    %grad
    tcoeff1(1:N)=coeff1(1:N)-grad(1:N)*alpha;
    tcoeff2(1:N)=coeff2(1:N)-grad(N+1:2*N)*alpha;
    [tcoeff1]= boundsSH(tcoeff1);
    [tcoeff2]= boundsSH(tcoeff2);
    coeff1m(step,:)=tcoeff1;
    coeff2m(step,:)=tcoeff2;
    newval=intsymdif(data,t,u0,tcoeff1,tcoeff2);
    vals(step+1)=newval;
    %newval=intsymdif(data,t,u0,coeff1,coeff2);
    %newval
    %coeff1=tempcoeff1;
    %coeff2=tempcoeff2;
    if (newval*.5)<(minval)
        coeff1=tcoeff1;
        coeff2=tcoeff2;
        val=newval;
        if (newval)<(minval)
            minval=newval;
        end
        flag=1;
    else
        return
        alpha=tou*alpha;
        flag=0;
    end
end