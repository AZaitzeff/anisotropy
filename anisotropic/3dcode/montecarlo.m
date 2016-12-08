parpool('local',12)
initializefunc
num=1;
for num=1:50
    coeff10=[-3.5448,-1,-2,0,-2,-.5];
    value=0;
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
    maxiter=10000;
    delta=.05;
    T=10;
    x=x0;
    x0=zeros(1,10);
    bestx=zeros(1,10);
    curval=energy(x);
    best=curval;
    step=1;
    while (step<maxiter && best>4)
        ind=ceil(rand()*10);
        pos=floor(rand()*2);
        change=zeros(1,10);
        change(ind)=delta-2*delta*pos;
        newx=x+change;
        newval=energy(x+change);
        if newval<curval
            x=x+change;
            curval=newval;
            if newval<best
                bestval=newval;
                bestx=x;
            end
        else
            p=rand();
            if p<exp((curval-newval)/T)
                x=x+change;
                curval=newval;
            end
        end
    end
    toc
    
    filename=strcat('trialMCone',int2str(num),'.mat');
    coeff1=[-3.5448,0,0,0,0,0];
    coeff1(2:6)=bestx(1:5);
    coeff2=[-3.5448,0,0,0,0,0];
    coeff2(2:6)=bestx(6:10);
    anistrophy
    difani0=sum(sum(sum(abs((ST0<1)-(STr<1)))));
    difanif=sum(sum(sum(abs((ST<1)-(STr<1)))));
    save(filename,'curval','bestval','x','coeff10','coeff20','coeff1r','coeff2r','coeff1','coeff2','difani0','difanif')
end
delete(gcp('nocreate'))