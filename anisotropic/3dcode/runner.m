parpool
[coeff1m,coeff2m,vals]=startscript([-3.5448,-.5,-1.5,0,-2,-.5],1000);
%coeff1r=[-3.5448,-1,-2,0,-2,-1];
%80483
save('coeffs.mat','coeff1m','coeff2m','vals')
%save('coeffssmooth.mat','coeff1m','coeff2m','vals')
delete(gcp('nocreate'))