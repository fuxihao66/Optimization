function [x,val,k,x_list,rlr_list]=newton(fun,gfun,hfun,x0)

maxk=10000;   
lr=0.5; %factor to decay
sigma=0.01; %lo
k=0;  epsilon=1e-5;
point_list = [];
lr_list = []
while(k<maxk)
    g=feval(gfun,x0); 
    G=feval(hfun,x0);
    Ginv = inv(G);
    s = -1*Ginv*g;
    
    if(norm(g)<epsilon), break; end
    m=0; mk=0;
    while(m<20)  
        if(feval(fun,x0+lr^m*s)<feval(fun,x0)+sigma*lr^m*g'*s)
            mk=m; break;
        end
        m=m+1;
    end
    
    point_list = [point_list, x0];
    lr_list = [lr_list, lr^mk];
    x0=x0+lr^mk*s;
    
    k=k+1;
end
x=x0;
val=feval(fun,x0); 
x_list=point_list;
rlr_list = lr_list;
