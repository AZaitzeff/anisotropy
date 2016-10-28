N1=4;
N2=3;
sizeu=64;
u0=zeros(N1,64,64,64);
u0(1,:,:,:) = getsphere(64,20);
u0(2,:,:,:)= getellipsoid(64,25,15,15,pi/4,pi/4,pi/4);
u0(3,:,:,:)= getellipsoid(64,25,25,15,0,0,0);
u0(4,:,:,:)= getellipsoid(64,15,20,25,0,0,0);
coeff1r=[-3.5448,-1,-2,0,-2,-1];
coeff2r=[-3.5448,0,-1,-1,1,0];
t=[10,20,30];

data=zeros(4,3,64,64,64);
for k=1:N1
    for i=1:N2
        data(k,i,:,:,:) = tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1r,coeff2r);
    end
end

n=31;
w1=linspace(-1,1,n);
w2=linspace(-1,1,n);

Z1=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z1(i,j)=intsymdif(data,t,u0,coeff1r+[0,1,0,0,0,0]*w1(i),coeff2r+[0,1,0,0,0,0]*w2(j));
    end
end

Z2=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z2(i,j)=intsymdif(data,t,u0,coeff1r+[0,0,1,0,0,0]*w1(i),coeff2r+[0,0,1,0,0,0]*w2(j));
    end
end

Z3=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z3(i,j)=intsymdif(data,t,u0,coeff1r+[0,0,0,1,0,0]*w1(i),coeff2r+[0,0,0,1,0,0]*w2(j));
    end
end

Z4=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z4(i,j)=intsymdif(data,t,u0,coeff1r+[0,0,0,0,1,0]*w1(i),coeff2r+[0,0,0,0,1,0]*w2(j));
    end
end

Z5=zeros(n,n);
for i =1:n;
    for j=1:n;
        Z5(i,j)=intsymdif(data,t,u0,coeff1r+[0,0,0,0,0,1]*w1(i),coeff2r+[0,0,0,0,0,1]*w2(j));
    end
end
save('surface.mat','Z1','Z2','Z3','Z4','Z5')

%surf(w1,w2,Z)