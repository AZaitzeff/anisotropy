function [coeff1m,coeff2m,vals,step]=startscript(coeff10,coeff20,nt,dt)
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
%coeff10=coeff1r+[0,.5,1.5,0,.5,.5]; %reg
%coeff20=coeff2r;

%coeff10=coeff1r+[0,.1,.1,-.1,.1,.1];
%coeff10=[-3.5448,-0.9656,-1.9503,-0.0873, -1.9521, -0.8870];
%coeff20=[-3.5448,0,0,0,0,0];

%coeff10=coeff1r+[0,0,.1,0,.1,.1]; %4
%coeff20=coeff2r+[0,0,.1,.1,.1,0];

%start = tdphysicalK3d(t,0.001,u0,coeff10,coeff20);
tic
[coeff1m,coeff2m,vals,step]=gradientdescK(data,t,nt,dt,u0,coeff10,coeff20);
toc
%u = tdphysicalK3d(t,0.001,u0,coeff1w,coeff2w);
%save('coeffs2.mat','coeff1m','coeff2m','vals')
%isosurface(reshape(data(1,1,:,:,:),[sizeu sizeu sizeu]),0.5); axis([1 64 1 64 1 64]); axis square

       
