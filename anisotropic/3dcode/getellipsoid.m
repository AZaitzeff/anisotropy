function u = getellipsoid(n,a,b,c,alpha,beta,gamma)
rotatea=[1,0,0;0,cos(-alpha),-sin(-alpha);0,sin(-alpha),cos(-alpha)];
rotateb=[cos(-beta),0,sin(-beta);0,1,0;-sin(-beta),0,cos(-beta)];
rotatec=[cos(-gamma),-sin(-gamma),0;sin(-gamma),cos(-gamma),0;0,0,1];
u = zeros(n,n,n);

for i=1:n
  for j=1:n
    for k=1:n
        vec=rotatea*rotateb*rotatec*[i-n/2;j-n/2;k-n/2];
        if (vec(1)/a)^2 + (vec(2)/b)^2 + (vec(3)/c)^2 < 1
            u(i,j,k) = 1;
        end
    end
  end
end