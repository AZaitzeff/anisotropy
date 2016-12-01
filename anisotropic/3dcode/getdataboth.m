N=209;
fvalsb=zeros(N,1);
intnormdifb1=zeros(N,1);
finnormdifb1=zeros(N,1);
intnormdifb2=zeros(N,1);
finnormdifb2=zeros(N,1);
intanidifb=zeros(N,1);
finanidifb=zeros(N,1);
val=zeros(N,1);
for num =1:N
    filename=strcat('trialboth',int2str(num),'.mat');
    load(filename)
    fvalsb(num)=fval;
    intnormdifb1(num)=norm(coeff10-coeff1r);
    finnormdifb1(num)=norm(coeff1-coeff1r);
    intnormdifb2(num)=norm(coeff20-coeff2r);
    finnormdifb2(num)=norm(coeff2-coeff2r);
    intanidifb(num)=difani0;
    finanidifb(num)=difanif;
    val(num)=minval(coeff1);
    clear difani0 difanif coeff10 coeff1r coeff1 fval coeff20 coeff2r coeff2;
end