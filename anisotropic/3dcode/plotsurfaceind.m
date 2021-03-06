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

n=3;
w1=linspace(-1,1,n);
w2=linspace(-1,1,n);

Z=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z(i,j)=intsymdif(data,t,u0,coeff1r+[0,0,0,0,.1,0]*w1(i),coeff2r+[0,0,0,0,.1,0]*w2(j));
    end
end

%surf(w1,w2,Z)
