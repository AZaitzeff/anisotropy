function val = intsymdif(data,t,u0,coeff1,coeff2)
%dt=0.001;
sizeu=64;
%u=reshape(data(1,:,:),[sizeu sizeu]);
[N1,N2,~,~,~]=size(data);
val=0;
sigma=.5;


%val=sum(sum(sum((imgaussfilt3(data,sigma)-imgaussfilt3(u,sigma)).^2)));
for k=1:N1
    total=sum(sum(data(k,1,:,:)));
    for i=1:N2;
        u=tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1,coeff2);
        symdif=sum(sum(sum((imgaussfilt3(reshape(data(k,i,:,:,:),[sizeu sizeu sizeu]),sigma)-imgaussfilt3(u,sigma)).^2)));
        val=val+symdif*sqrt(total/(sum(sum(sum(data(k,i,:,:,:))))+1));
    end
end