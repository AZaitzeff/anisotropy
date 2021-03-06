total=floor(step/10);
valsani=zeros(total,1);
n=40;
a=3.5;
[x,y,z] = meshgrid(linspace(-a,a,n),linspace(-a,a,n),linspace(-a,a,n));
coeff1r=[-3.5448,-1,-2,0,-2,-1];
STr=zeros(size(x));
for i=1:n
    for j=1:n
        for k=1:n
            STr(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1r);
        end
    end
end

parfor num=1:total
    ST=zeros(size(x));
    for i=1:n
        for j=1:n
            for k=1:n
                ST(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1m(num*10,:));
            end
        end
    end
    %vol=sum(sum(sum(ST<1)));
    valsani(num)=sum(sum(sum(abs((ST<1)-(STr<1)))));
end


%for num=50:100:250
%    ST=zeros(size(x));
%    for i=1:n
%        for j=1:n
%            for k=1:n
%                ST(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1m(num,:));
%            end
%        end
%    end
%    vol=sum(sum(sum(ST<1)));
%    vals1((num-50)/100+8)=sum(sum(sum(((ST<1)-STr<1))));
%    vals2((num-50)/100+8)=sum(sum(sum(((ST*(7700/vol))<1-STr<1))));
%end