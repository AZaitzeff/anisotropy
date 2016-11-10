parpool
%[coeff1m,coeff2m,vals]=startscript([-3.5448,-.5,-1.5,0,-2,-.5],500);
[coeff1m,coeff2m,vals]=startscript([-3.5448,-.9001,-1.78,-0.0120,-2.3349,-.7488],1000);
%coeff1r=[-3.5448,-1,-2,0,-2,-1];
%80483
save('coeffsr2.mat','coeff1m','coeff2m','vals')
%save('coeffssmooth.mat','coeff1m','coeff2m','vals')
delete(gcp('nocreate'))