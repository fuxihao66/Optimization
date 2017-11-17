x0=[0.1,1]';
[x,val,k,point_list]=grad('fun','gfun',x0)
%[x,val,k,point_list]=grad(@fun,@gfun,x0)
minus_list = []
ratio_list = []
len = size(point_list)
len = len(2)
for i=1:len-1
    fi1 = feval('fun',point_list(:,i))
    fi2 = feval('fun',point_list(:,i+1))
    minus_list = [minus_list,fi2-fi1]
end
for i=1:len-2
    l = minus_list(i+1)/minus_list(i);
    sprintf('%d:%f',i,l)   
end
