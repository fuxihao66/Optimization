x0 = [-1.2,1]'
[x,val,k,x_list,lr_list]=grad('fun','gfun',x0);
% lr_list;

x = -1.2:0.01:1.5;
y = 0.95:0.01:1.25;
[X, Y] = meshgrid(x, y);
Z = 100*(Y-X.^2).^2 + (1-X).^2;
n = 20;
contour(X,Y,Z,n)
hold on;
x_axis = x_list(1,:);
y_axis = x_list(2,:);
plot(x_axis,y_axis,'-.or','MarkerFaceColor','g');