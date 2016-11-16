parpool
numiters=800;
[coeff1m,coeff2m,vals]=startscript([-3.5448,-1,-1.5,0,-2,-.5],[-3.5448,0,-1,-1.5,-1,0],numiters);

%[coeff1m,coeff2m,vals]=startscript([-3.5448,-.9001,-1.78,-0.0120,-2.3349,-.7488],1000);
%coeff1r=[-3.5448,-1,-2,0,-2,-1];
%coeff2r=[-3.5448,0,-1,-1,-1,0];
%80483
difference
save('coeffs2.mat','coeff1m','coeff2m','vals','valsani')
%save('coeffssmooth.mat','coeff1m','coeff2m','vals')
delete(gcp('nocreate'))