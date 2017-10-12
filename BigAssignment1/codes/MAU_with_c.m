A = [1 1 1 0 -1 0 0 0 0 0 0 0 0; 
    -1 0 0 1 0 0 0 0 -1 0 0 0 0; 
    0 -1 0 0 1 1 0 0 0 0 0 0 0;
    0 0 -1 0 0 0 1 1 0 0 -1 0 0;
    0 0 0 -1 0 0 -1 0 1 1 0 0 -1;
    0 0 0 0 0 -1 0 -1 0 0 1 1 0;
    0 0 0 0 0 0 0 0 0 -1 0 -1 1];
OO = zeros([7,13])
jj = [0 0 0 0 0 0 0]';
kk = [A OO OO OO jj; OO A OO OO jj;OO OO A OO jj; OO OO OO A jj];

b_1 = [4 -4 0 0 0 0 0];
b_2 = [4 0 -4 0 0 0 0];
b_3 = [0 -4 4 0 0 0 0];
b_4 = [4 0 0 0 0 0 -4];
bb = [b_1 b_2 b_3 b_4]';

CC = zeros([13,53]);
for i=1:1:13
    CC(i,53)=-1;
    
    CC(i,i)=0.2;
    CC(i,i+13)=0.2;
    CC(i,i+26)=0.2;
    CC(i,i+39)=0.2;
    
end
D = zeros([13,53]);
for i=1:1:13
    D(i,i)=1;
    D(i,i+13)=1;
    D(i,i+26)=1;
    D(i,i+39)=1;
end
c_1 = zeros([1,13]);
c_2 = zeros([1,13]);
for i=1:1:13
    c_2(i) = 5;
end
c = [c_1 c_2]'
CC = [CC;D]
lb = zeros([53,1]);
ub = [];
z = zeros([53,1]);
z(53) = 1
[f,fval] = linprog(z,CC,c,kk,bb,lb,ub);
sum = zeros([1,13])
phi = zeros([1,13])
for i=1:1:13
    sum(i) = f(i,1)+f(i+13,1)+f(i+26,1)+f(i+39,1);
    phi(i) = sum(i)/5;
end
sum
phi
