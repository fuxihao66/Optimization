function [x,val,k,x_list, rlr_list]=grad(fun,gfun,x0)

maxk=50000;   
lr=0.4; %factor to decay
sigma=0.01; %lo
k=0;  epsilon=1e-5;
%G = [20,0;0,2]
point_list = [];
lr_list = []
while(k<maxk)
    g=feval(gfun,x0); 
    p=-g;   
    if(norm(g)<epsilon), break; end
    m=0; mk=0;
    while(m<20)  
        if(feval(fun,x0+lr^m*p)<feval(fun,x0)+sigma*lr^m*g'*p)
            mk=m; break;
        end
        m=m+1;
    end
    
    point_list = [point_list, x0];
    lr_list = [lr_list, lr^mk];
    x0=x0+lr^mk*p;
    
%     x0 = x0 - (g'*g/(g'*G*g)) *g
    k=k+1;
end
x=x0;
val=feval(fun,x0); 
x_list=point_list;
rlr_list = lr_list;
