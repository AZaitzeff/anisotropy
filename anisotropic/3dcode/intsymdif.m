function val = intsymdif(data,t,u0,coeff1,coeff2)
sizeu=64;
[N1,N2,~,~,~]=size(data);
val=0;
%sigma=.5;

parfor n=1:N1*N2%Goes through all observations
    k=mod(n-1,N1)+1;%initial state 
    i=floor((n-1)/N1)+1;%time state
    total=sum(sum(data(k,1,:,:)));
    u=tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1,coeff2);
    %symdif=sum(sum(sum((imgaussfilt3(reshape(data(k,i,:,:,:),[sizeu sizeu sizeu]),sigma)-imgaussfilt3(u,sigma)).^2)));
    symdif=sum(sum(sum((reshape(data(k,i,:,:,:),[sizeu sizeu sizeu])-u).^2)));
    val=val+symdif*sqrt(total/(sum(sum(sum(data(k,i,:,:,:))))+1));
end