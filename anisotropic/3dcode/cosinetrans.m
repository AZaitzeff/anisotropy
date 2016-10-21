function vals = cosinetrans(n,coeff1)
degree=2;
dl=2;
[ x, y, z, w ] = ld0302 ();
x3=zeros(1,1,302);
y3=zeros(1,1,302);
z3=zeros(1,1,302);
w3=zeros(1,1,302);
x3(:)=x(:);
y3(:)=y(:);
z3(:)=z(:);
w3(:)=w(:);
[theta,phi,~] = cart2sph(x3,y3,z3);
phi = pi/2 - phi;

[omega] = real_spherical_harmonics_multi(phi,theta, coeff1, degree, dl);

vals=sum(sum(w3.*(omega.*abs(x3*n(1)+y3*n(2)+z3*n(3)))));