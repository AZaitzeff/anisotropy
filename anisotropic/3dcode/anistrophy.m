n=40;
a=3.5;
[x,y,z] = meshgrid(linspace(-a,a,n),linspace(-a,a,n),linspace(-a,a,n));

STr=zeros(size(x));
for i=1:n
    for j=1:n
        for k=1:n
            STr(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1r);
        end
    end
end

%STw=zeros(size(x));
%for i=1:n
%    for j=1:n
%        for k=1:n
%            STw(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1w);
%        end
%    end
%end

ST0=zeros(size(x));
for i=1:n
    for j=1:n
        for k=1:n
            ST0(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1m(1,:));
        end
    end
end

ST=zeros(size(x));
for i=1:n
    for j=1:n
        for k=1:n
            ST(i,j,k)=cosinetrans([x(i,j,k),y(i,j,k),z(i,j,k)],coeff1m(2120,:));
        end
    end
end
% 63128
% 63122  
% 63122 
% 63120
% 63128  
% 63120  
% 63110  
% 63102   
% 63098        
% 63098 

