%coeff1=[-3.5448,0,-1,-2,1,0];
coeff1l=coeff2;
%[coeff1l]= boundsSH(coeff2r);
%coeff1l=coeff1;
%coeff2=[.1,.5,.5,.5,.1,.1];
u0 = getsphere(64,20);
n = size(u0,1);
[x,y,z] = meshgrid([1:1:n],[1:1:n],[1:1:n]);
x = min(x-1,n-x+1);
y = min(y-1,n-y+1);
z = min(z-1,n-z+1);
xx = x / (n-1);
yy = y / (n-1);
zz = z / (n-1);
t=10;
[theta,phi,r] = cart2sph(xx,yy,zz);
phi = pi/2 - phi;
dl=2;
degree=2;
%tic
[omega] = real_spherical_harmonics_multi(phi,theta, coeff1l, degree, dl); 
%toc
%omega1=zeros(size(theta));
%tic
%for i=1:64
%    for j=1:64
%        for k=1:64
%            angles=[phi(i,j,k),theta(i,j,k)];
%            [omega1(i,j,k),~] = real_spherical_harmonics(angles, coeff1, degree, dl);    % Inverse cosine transform of sigma.
%        end
%    end
%end
%toc
%plot(omega(:))
min(omega(:))