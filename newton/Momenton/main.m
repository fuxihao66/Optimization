n = 20;
x0=zeros(n,1);
G = zeros(n,n);
b = zeros(n,1);
for i=1:n
    b(i) = 1;
end
for i=1:n
    for j=1:n
        G(i,j)=1/(i+j-1);
    end
end
[x,k,x_list] = cgm(G,b,x0);
sprintf('iteration times:%d',k)
x'

