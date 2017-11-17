function [x,val,k,x_list]=grad(fun,gfun,x0)

maxk=5000;   
rho=0.5;sigma=0.4;
k=0;  epsilon=1e-5;
G = [20,0;0,2]
point_list = [];
while(k<maxk)
    g=feval(gfun,x0); 
    % d=-g;   
    if(norm(g)<epsilon), break; end
    % m=0; mk=0;
    % while(m<20)  
    %     if(feval(fun,x0+rho^m*d)<feval(fun,x0)+sigma*rho^m*g'*d)
    %         mk=m; break;
    %     end
    %     m=m+1;
    % end
    % x0=x0+rho^mk*d;
    point_list = [point_list, x0]
    x0 = x0 - (g'*g/(g'*G*g)) *g
    k=k+1;
end
x=x0;
val=feval(fun,x0); 
x_list=point_list

