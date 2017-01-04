parpool('local',12)


for num=1:5
    N1=4;
    initializefunc
    %value=0;
    coeff10=[-3.5448,-.1,-.1,-.1,-.1,-.1];
    %while(value<.2)
    %    per=randn(1,5);
    %    coeff10(2:6)=[-1,-2,0,-2,-.5]+per/norm(per)*(rand()*2+.5);
    %    value=minval(coeff10);
    %end
    %value2=0;
    coeff20=[-3.5448,-.1,-.1,-.1,-.1,-.1];
    %while(value2<.3)
    %    per=randn(1,5);
    %    coeff20(2:6)=[.1,-.1,-.1,-.1,.1]+per/norm(per)*(rand()*.25);
    %    value2=minval(coeff20);
    %end
    xstart=zeros(1,10);
    xstart(1:5)=coeff10(2:6);
    xstart(6:10)=coeff20(2:6);
    M=5;
    bounds=ones(1,10)*.5;
    bounds(1:5)=M;
    %'lb',-bounds,'ub',bounds
    problem = createOptimProblem('fmincon','x0',xstart,'objective',energy,'nonlcon',@(x)constraintsSH(x));
    gs = GlobalSearch('NumTrialPoints',5000,'NumStageOnePoints',400);
    tic
    [optx,fmin,exitflag,output,manymins] = run(gs,problem);
    toc
    filename=strcat('trialglobalall4points',int2str(num),'.mat');
    changeback
    anistrophy
    difani0=sum(sum(sum(abs((ST0<1)-(STr<1)))));
    difanif=sum(sum(sum(abs((ST<1)-(STr<1)))));
    save(filename,'optx','fmin','exitflag','output','manymins','coeff10','coeff20','coeff1r','coeff2r','coeff1','coeff2','difani0','difanif')
end
delete(gcp('nocreate'))