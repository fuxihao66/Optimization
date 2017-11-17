function [x,k,x_list]=cgm(G,b,x0)
epsilon = 1e-6;
g0 = G*x0-b;
p = -1*g0;
k = 0; max_iteration_times = 10000;
p_list = [];
while(k<max_iteration_times)
    if(norm(g0)<epsilon) break; end
    d = G*p;
    a = g0'*g0/(p'*d);
    x0 = x0+a*p;
    g = g0+a*d;
    beta = g'*g/(g0'*g0);
    g0 = g;
    p = -1*g0+beta*p;
    p_list = [p_list,x0];
    k = k+1;
end
x = x0;
x_list = p_list;