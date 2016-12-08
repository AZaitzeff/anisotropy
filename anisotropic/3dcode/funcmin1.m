parpool('local',12)
for num=1:100
    initializefunc
    %options = optimoptions('fminunc','Algorithm','quasi-newton','HessUpdate','steepdesc','MaxIter',4000,'MaxFunEvals',10000);
    options = optimoptions('fminunc','Algorithm','quasi-newton','MaxIter',4000,'MaxFunEvals',10000);
    value=0;
    coeff10=[-3.5448,-1,-2,0,-2,-.5];
    while(value<.2)
        per=randn(1,5);
        coeff10(2:6)=[-1,-2,0,-2,-.5]+per/norm(per)*(rand()*2+.5);
        value=minval(coeff10);
    end
    value2=0;
    coeff20=[-3.5448,.1,-.1,-.1,-.1,.1];
    while(value2<.5)
        per=randn(1,5);
        coeff20(2:6)=[.1,-.1,-.1,-.1,.1]+per/norm(per)*(rand()*.25);
        value2=minval(coeff20);
    end
    x0=zeros(1,10);
    x0(1:5)=coeff10(2:6);
    x0(6:10)=coeff20(2:6);
    
    maxiter=20;
    d=.5;
    
    bestx=x0;
    curx=x0;
    best=energy(curx);
    step=1;
    tic
    while (step<maxiter && best>4)
        [curx,fval,exitflag,output] = fminunc(energy,curx,options);
        if fval<best
            bestval=fval;
            bestx=curx;
        end
        per=randn(1,10);
        change=per/norm(per)*d;
        curx=curx+change;
        step=step+1;
    end
    toc
    optx=bestx;
    filename=strcat('trialQN',int2str(num),'.mat');
    changeback
    anistrophy
    difani0=sum(sum(sum(abs((ST0<1)-(STr<1)))));
    difanif=sum(sum(sum(abs((ST<1)-(STr<1)))));
    save(filename,'curx','bestval','exitflag','output','coeff10','coeff20','coeff1r','coeff2r','coeff1','coeff2','difani0','difanif')
end
delete(gcp('nocreate'))