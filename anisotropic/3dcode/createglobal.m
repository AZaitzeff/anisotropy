parpool('local',2)

initializefunc
xstart=zeros(1,10);
coeff10=[-3.5448,0,0,0,0,0];
coeff20=[-3.5448,0,0,0,0,0];
coeff10(2:6)=xstart(1:5);
coeff20(2:6)=xstart(6:10);
problem = createOptimProblem('fmincon','x0',xstart,'objective',energy,'nonlcon',constraintsSH);
gs = GlobalSearch('Display','iter');
[optx,fmin,exitflag,output,manymins] = run(gs,problem);
filename=strcat('trialglobal2.mat');
changeback
anistrophy
difani0=sum(sum(sum(abs((ST0<1)-(STr<1)))));
difanif=sum(sum(sum(abs((ST<1)-(STr<1)))));
save(filename,'curx','fmin','exitflag','output','manymins','coeff10','coeff20','coeff1r','coeff2r','coeff1','coeff2','difani0','difanif')
delete(gcp('nocreate'))