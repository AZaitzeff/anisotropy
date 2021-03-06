parpool('local',4)
numiters=2000;
coeff10=[-3.5448,-1,-1.9,0,-1.5,-.8];
coeff20=[-3.5448,0,-.8,-1,-1.2,0];
dt=.000001;
[coeff1m,coeff2m,vals,step]=startscript(coeff10,coeff20,numiters,dt);

%[coeff1m,coeff2m,vals]=startscript([-3.5448,-.9001,-1.78,-0.0120,-2.3349,-.7488],1000);
coeff1r=[-3.5448,-1,-2,0,-2,-1];
coeff2r=[-3.5448,0,-1,-1,-1,0];
%80483
difference
save('data4.mat','coeff1m','coeff2m','coeff10','coeff20','coeff1r','coeff2r','vals','valsani')
%save('coeffssmooth.mat','coeff1m','coeff2m','vals')
delete(gcp('nocreate'))