function u = getsphere(n,r)

u = zeros(n,n,n);

for i=1:n
  for j=1:n
    for k=1:n
        vec=[i-n/2;j-n/2;k-n/2];
        if (vec(1))^2 + (vec(2))^2 + (vec(3))^2 < r^2
            u(i,j,k) = 1;
        end
    end
  end
end