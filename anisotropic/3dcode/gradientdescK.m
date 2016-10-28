function [coeff1m,coeff2m,grad] = gradientdescK(data,t,nt,dt,u0,coeff10,coeff20)
h=.01;
N=numel(coeff10);
grad=zeros(1,2*N);
A = eye(N); 
coeff1m=zeros(nt,N);
coeff2m=zeros(nt,N);
coeff1=coeff10;
coeff2=coeff20;
%val=intsymdif(data,t,u0,coeff1,coeff2);
%val
alpha=dt;
tou=.98;
flag=1;
for step=1:nt
    if flag==1;
        for e=2:N
            grad(e)=(intsymdif(data,t,u0,coeff1+A(e,:)*h*.5,coeff2)-intsymdif(data,t,u0,coeff1-A(e,:)*h*.5,coeff2))/h;
        end
        for e=2:N
            grad(e+N)=(intsymdif(data,t,u0,coeff1,coeff2+A(e,:)*h*.5)-intsymdif(data,t,u0,coeff1,coeff2-A(e,:)*h*.5))/h;
        end
    end
    %grad
    coeff1(1:N)=coeff1(1:N)-grad(1:N)*alpha;
    coeff2(1:N)=coeff2(1:N)-grad(N+1:2*N)*alpha;
    [coeff1]= boundsSH(coeff1);
    [coeff2]= boundsSH(coeff2);
    coeff1m(step,:)=coeff1;
    coeff2m(step,:)=coeff2;
    %tempw(tempw<1)=1;
    %tempcoeff1(tempcoeff1<0)=0;
    %tempcoeff2(tempcoeff2<0)=0;
    %newval=intsymdif(data,t,u0,coeff1,coeff2);
    %newval
    %coeff1=tempcoeff1;
    %coeff2=tempcoeff2;
    %val=newval;
    %if newval<(val)
    %    coeff1=tempcoeff1;
    %    coeff2=tempcoeff2;
    %    val=newval;
    %    flag=1;
    %else
    %    alpha=tou*alpha;
    %    flag=0;
    %end
end