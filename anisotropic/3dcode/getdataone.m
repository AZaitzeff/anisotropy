N1=2;
N2=4;
N=N1+N2;
fvals=zeros(N,1);
intnormdif1=zeros(N,1);
finnormdif1=zeros(N,1);
intnormdif2=zeros(N,1);
finnormdif2=zeros(N,1);
intanidif=zeros(N,1);
finanidif=zeros(N,1);
val=zeros(N,1);
for num =1:N
    if num<=N1
        filename=strcat('trialglobalall',int2str(num),'.mat');
    else
        filename=strcat('trialglobalallsec',int2str(num-N1),'.mat');
    end
    load(filename)
    fvals(num)=fmin;
    intnormdif1(num)=norm(coeff10-coeff1r);
    finnormdif1(num)=norm(coeff1-coeff1r);
    intnormdif2(num)=norm(coeff20-coeff2r);
    finnormdif2(num)=norm(coeff2-coeff2r);
    intanidif(num)=difani0;
    finanidif(num)=difanif;
    val(num)=minval(coeff1);
    clear difani0 difanif coeff10 coeff1r coeff1 coeff20 coeff2r coeff2 fval;
end
    