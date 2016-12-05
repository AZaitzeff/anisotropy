N=110;
fvals=zeros(N,1);
intnormdif=zeros(N,1);
finnormdif=zeros(N,1);
intanidif=zeros(N,1);
finanidif=zeros(N,1);
coeff10s=zeros(N,6);
for num =1:N
    filename=strcat('trialonetwo',int2str(num),'.mat');
    load(filename)
    fvals(num)=fval;
    intnormdif(num)=norm(coeff10-coeff1r);
    finnormdif(num)=norm(coeff1-coeff1r);
    coeff10s(num,:)=coeff10-coeff1r;
    intanidif(num)=difani0;
    finanidif(num)=difanif;
    val(num)=minval(coeff1);
    clear difani0 difanif coeff10 coeff1r coeff1 fval;
end
    