parpool('local',2)

N1=6;
N2=2;
sizeu=64;
u0=zeros(N1,64,64,64);
u0(1,:,:,:) = getsphere(64,20);
u0(2,:,:,:)= getellipsoid(64,30,10,10,pi/4,pi/4,pi/4);
u0(3,:,:,:)= getellipsoid(64,30,10,10,0,0,0);
u0(4,:,:,:)= getellipsoid(64,10,30,10,0,0,0);
u0(5,:,:,:)= getellipsoid(64,10,10,30,0,0,0);
u0(6,:,:,:)= getellipsoid(64,30,10,10,3*pi/4,3*pi/4,pi/4);
coeff1r=[-3.5448,-1,-2,0,-2,-1];
coeff2r=[-3.5448,0,-1,-1,-1,0];
t=[10,20];

data=zeros(N1,N2,64,64,64);
for k=1:N1
    for i=1:N2
        data(k,i,:,:,:) = tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1r,coeff2r);
    end
end
fun=@(x)convert(data,t,u0,x);
options = optimoptions('fminunc','Algorithm','quasi-newton','MaxIter',5);
coeff10=[-3.5448,-.9,-1.9,0,-2.1,-1.1];
coeff20=[-3.5448,0,-1,-1,-1,0];
x0=zeros(1,10);
x0(1:5)=coeff10(2:6);
x0(6:10)=coeff20(2:6);
tic
[optx,fval,exitflag,output,grad,hessian] = fminunc(fun,x0,options);
toc
delete(gcp('nocreate'))
%save('data5.mat','optx','fval','exitflag','output','grad','hessian')