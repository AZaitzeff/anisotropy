
N1=4;
N2=3;
sizeu=64;
u0=zeros(N1,64,64,64);
u0(1,:,:,:) = getsphere(64,20);
u0(2,:,:,:)= getellipsoid(64,25,15,15,pi/4,pi/4,pi/4);
u0(3,:,:,:)= getellipsoid(64,25,25,15,0,0,0);
u0(4,:,:,:)= getellipsoid(64,15,20,25,0,0,0);
coeff1r=[-3.5448,-1,-2,0,-2,-1.75];
coeff2r=[-3.5448,0,-1,-2,1,0];
t=[10,20,30];

data=zeros(4,3,64,64,64);
for k=1:N1
    for i=1:N2
        data(k,i,:,:,:) = tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1r,coeff2r);
    end
end
%coeff10=coeff1r;
%coeff20(2:6)=coeff20(2:6)+randn(1,5)*.5;
coeff10=[-3.5448,0,0,0,0,0];
%coeff20=coeff2r;
%coeff20(2:6)=coeff20(2:6)+randn(1,5)*.5;
coeff20=[-3.5448,0,0,0,0,0];
%start = tdphysicalK3d(t,0.001,u0,coeff10,coeff20);
tic
[coeff1,coeff2,alpha]=gradientdescK(data,t,250,.00005,u0,coeff10,coeff20);
toc

coeff1

coeff2
%u = tdphysicalK3d(t,0.001,u0,coeff1w,coeff2w);

%isosurface(reshape(data(1,1,:,:,:),[sizeu sizeu sizeu]),0.5); axis([1 64 1 64 1 64]); axis square
