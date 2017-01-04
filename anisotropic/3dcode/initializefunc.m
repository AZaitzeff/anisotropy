%N1=6;
N2=2;
sizeu=64;
u0=zeros(N1,64,64,64);
u0(1,:,:,:) = getsphere(64,20);
u0(2,:,:,:)= getellipsoid(64,30,10,10,pi/4,pi/4,pi/4);
u0(3,:,:,:)= getellipsoid(64,30,10,10,0,0,0);
u0(4,:,:,:)= getellipsoid(64,10,30,10,0,0,0);
u0(5,:,:,:)= getellipsoid(64,10,10,30,0,0,0);
u0(6,:,:,:)= getellipsoid(64,30,10,10,3*pi/4,3*pi/4,pi/4);
value=0;
coeff1r=[-3.5448,0,0,0,0,0];
while(value<.2)
    per=randn(1,5);
    coeff1r(2:6)=per/norm(per)*(1+rand()*4);
    value=minval(coeff1r);
end
value2=0;
coeff2r=[-3.5448,0,0,0,0,0];
while(value2<.5)
    per=randn(1,5);
    coeff2r(2:6)=per/norm(per)*(rand()*.5);
    value2=minval(coeff2r);
end
norm(coeff1r)
t=[10,20];

data=zeros(N1,N2,64,64,64);
for k=1:N1
    for i=1:N2
        data(k,i,:,:,:) = tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1r,coeff2r);
    end
end
energy=@(x)convert(data,t,u0,x);