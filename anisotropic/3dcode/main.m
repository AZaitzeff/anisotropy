sizeu=256;
u0 = getcircle(sizeu,32);
dt=0.0002;
t=[0,1,2,3,4];
N=numel(t);
truew=[2,4.5,3,2,3,4.5,5,2];
%truew=[1,2,.5,.3,.15,.2,.05,.1];
data=zeros(N,sizeu,sizeu);
%data(1,:,:)=deform(u0,.01);
data(1,:,:)=u0;
truedata=zeros(N,sizeu,sizeu);
truedata(1,:,:)=u0;
u=u0;
for i=2:N;
    u=tdphysicalK(t(i)-t(i-1),dt,u,truew);
    %u=1.*(u>.5);
    truedata(i,:,:)=u;
    data(i,:,:)=deform(u,.01);
    %data(i,:,:)=u;
end
%minval=inf;
%ws=ones(8,numel(truew));
%ws=ones(4,numel(truew));
for i=  3:8,
    w0=ones(size(truew))+rand(size(truew))*6;
    %w0=rand(size(truew)).*[3,3,.6,.6,.25,.25,.15,.15];
    time = cputime;
    tempw=gradientdescK(data,t,3000,.01,w0);
    %tempw=montecarloK(data,t,3000,3,w0);
    e = cputime-time;
    tempmin=intsymdif(data,t,tempw);
    ws(i,:)=tempw;
    if tempmin<minval
        minval=tempmin;
        w=tempw;
    end
end
neww=w;
%w=gradientdescK(data,t,800,.0001,w);
%w=gradientdescK(data,t,200,.0001,w);

newdata=zeros(N,sizeu,sizeu);
newdata(1,:,:)=data(1,:,:);
u=reshape(data(1,:,:),[sizeu,sizeu]);
for i=2:N;
    u=tdphysicalK(t(i)-t(i-1),dt,u,w);
    %u=u>.5;
    newdata(i,:,:)=u;
end
%axis equal; imagesc(reshape(data(4,:,:),[size size]));