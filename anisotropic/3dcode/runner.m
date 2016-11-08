parpool
[coeff1m,coeff2m,vals]=startscript([-3.5448,-.5,-1.5,0,-2.5,-.5],1);
%coeff1r=[-3.5448,-1,-2,0,-2,-1];
save('coeffs3.mat','coeff1m','coeff2m','vals')
delete(gcp('nocreate'))