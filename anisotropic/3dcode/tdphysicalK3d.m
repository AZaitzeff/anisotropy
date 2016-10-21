function [u] = tdphysicalK3d(nt,dt,u,coeff1,coeff2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [u] = tdphysicalK3d(nt,dt,u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Threshold dynamics where the kernel is defined in physical
% space.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computational domain is assumed to be [0,1] x [0,1].
n = size(u,1);
[x,y,z] = meshgrid([1:1:n],[1:1:n],[1:1:n]);
x = min(x-1,n-x+1);
y = min(y-1,n-y+1);
z = min(z-1,n-z+1);
xx = x / (n-1);
yy = y / (n-1);
zz = z / (n-1);

% Convolution kernel construction:
K = zeros(size(u));
% Change the following line to define your kernel:
%K = eta(sqrt( (x/r).^2 + (y/r).^2 ));
K = kernel(xx/sqrt(dt),yy/sqrt(dt),zz/sqrt(dt),coeff1,coeff2);
K = K / sum(K(:));
Kf = fftn(K);

Z = -ones(n,n,n); % Aux. variable, used in calling ls2vf2D.
[sub1,sub2,sub3] = ind2sub([n n n],[1:n*n*n]'); % Aux. variable, used in calling ls2vf2D.

for t=1:nt

  % Convolutions:
  uK = real(ifftn( fftn(u) .* Kf ));

  % Thresholding step:
  vals = ls2vf3D(int32(sub1),int32(sub2),int32(sub3),uK(:)-0.5,Z,n,n,n);
  u(:) = vals;
  
end

function y = eta(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Smooth bump function compactly supported in [0,1].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  r = 2;
  ind = find( (x>0).*(x<r) );
  y = 0*x;

  y(ind) = exp( -1 ./ ( x(ind).^2 .* (r-x(ind)).^2 ) );

function K = kernel(x,y,z,coeff1,coeff2)
  %m0 = 0.3403;
  m1 = 0.3403;
  %m2 = 0.3737;
  m3 = 0.4406;

  [theta,phi,r] = cart2sph(x,y,z);
  phi = pi/2 - phi;

  % These lines are the same for any anisotropy:

  dl=2;
  degree=2;
  %omega=sin(theta);
  %invrad=ones(size(theta));
  omega=real_spherical_harmonics_multi(phi,theta, coeff1, degree, dl);
  invrad=real_spherical_harmonics_multi(phi,theta, coeff2, degree, dl);
  % Inverse sph. radon transform of 1/mu.
  a = m3/m1^2 * invrad.^2 ./ omega;
  b = sqrt( m3/m1 * invrad ./ omega );

  K = a.*eta(b.*r);
