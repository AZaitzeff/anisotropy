function val = minval(coeff1l)
n = 64;
[x,y,z] = meshgrid([1:1:n],[1:1:n],[1:1:n]);
x = min(x-1,n-x+1);
y = min(y-1,n-y+1);
z = min(z-1,n-z+1);
xx = x / (n-1);
yy = y / (n-1);
zz = z / (n-1);
[theta,phi,r] = cart2sph(xx,yy,zz);
phi = pi/2 - phi;
dl=2;
degree=2;
%tic
[omega] = real_spherical_harmonics_multi(phi,theta, coeff1l, degree, dl); 
val=min(omega(:));