u0 = getsphere(64,20);
%coeff1r=[-3.5448,-1,-2,-1,-2,-.5];
%coeff2r=[-3.5448,-1,-2,-1,-2,-.5];
coeff1r=[-3.5448,-1,-2,0,-2,-1.75];
coeff2r=[-3.5448,0,-1,-2,1,0];
t=30;

data = tdphysicalK3d(t,0.001,u0,coeff10,coeff20);

isosurface(data,0.5); axis([1 64 1 64 1 64]); axis square
%isosurface(x,y,z,ST,1);axis([-a a -a a -a a]); axis square
%guass=imgaussfilt3(data,.5);
%imagesc(guass(:,:,20));