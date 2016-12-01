parpool('local',8)
for num=1:500
    initializefunc
    options = optimoptions('fminunc','Algorithm','quasi-newton','HessUpdate','steepdesc','MaxIter',2000);
    value=0;
    coeff10=[-3.5448,-1,-2,0,-2,-.5];
    while(value<.2)
        per=randn(1,5);
        coeff10(2:6)=[-1,-2,0,-2,-.5]+per/norm(per)*(rand()*2+.5);
        value=minval(coeff10);
    end
    coeff20=[-3.5448,.1,-.1,-.1,-.1,.1];
    x0=zeros(1,10);
    x0(1:5)=coeff10(2:6);
    x0(6:10)=coeff20(2:6);
    tic
    [optx,fval,exitflag,output] = fminunc(energy,x0,options);
    toc
    
    filename=strcat('trialonetwo',int2str(num),'.mat');
    changeback
    anistrophy
    difani0=sum(sum(sum(abs((ST0<1)-(STr<1)))));
    difanif=sum(sum(sum(abs((ST<1)-(STr<1)))));
    save(filename,'fval','exitflag','output','coeff10','coeff20','coeff1r','coeff2r','coeff1','coeff2','difani0','difanif')
end
delete(gcp('nocreate'))