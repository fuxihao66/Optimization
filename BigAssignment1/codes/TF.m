A = [1 1 1 0 -1 0 0 0 0 0 0 0 0; 
    -1 0 0 1 0 0 0 0 -1 0 0 0 0; 
    0 -1 0 0 1 1 0 0 0 0 0 0 0;
    0 0 -1 0 0 0 1 1 0 0 -1 0 0;
    0 0 0 -1 0 0 -1 0 1 1 0 0 -1;
    0 0 0 0 0 -1 0 -1 0 0 1 1 0;
    0 0 0 0 0 0 0 0 0 -1 0 -1 1];
OO = zeros([7,13]);
kk = [A OO OO OO OO; OO A OO OO OO;OO OO A OO OO; OO OO OO A OO];

b_1 = [4 -4 0 0 0 0 0];
b_2 = [4 0 -4 0 0 0 0];
b_3 = [0 -4 4 0 0 0 0];
b_4 = [4 0 0 0 0 0 -4];
bb = [b_1 b_2 b_3 b_4]';

CC = zeros([78,65]);
for i=1:1:13
    CC(i,52+i)=-1;   
    
    CC(i,i)=1;
    CC(i,i+13)=1;
    CC(i,i+26)=1;
    CC(i,i+39)=1;
end
for i=14:1:26
    CC(i,52+i-13)=-1;   
    
    CC(i,i-13)=3;
    CC(i,i)=3;
    CC(i,i+13)=3;
    CC(i,i+26)=3;  
end
for i=27:1:39
    CC(i,52+i-26)=-1;   
    CC(i,i-26)=10;
    CC(i,i-13)=10;
    CC(i,i)=10;
    CC(i,i+13)=10;
end
for i=40:1:52
    CC(i,52+i-39)=-1;   
    CC(i,i-39)=70;
    CC(i,i-26)=70;
    CC(i,i-13)=70;
    CC(i,i)=70;
end
for i=53:1:65
    CC(i,i)=-1;   
    CC(i,i-52)=500;
    CC(i,i-39)=500;
    CC(i,i-26)=500;
    CC(i,i-13)=500;
end
for i=66:1:78
    CC(i,i-13)=-1;   
    CC(i,i-65)=5000;
    CC(i,i-52)=5000;
    CC(i,i-39)=5000;
    CC(i,i-26)=5000;
end

D = zeros([13,65]);
for i=1:1:13
    D(i,i)=1;
    D(i,i+13)=1;
    D(i,i+26)=1;
    D(i,i+39)=1;
end

CC = [CC;D]

c_1 = zeros([1,13]);
c_2 = zeros([1,13]);
c_3 = zeros([1,13]);
c_4 = zeros([1,13]);
c_5 = zeros([1,13]);
c_6 = zeros([1,13]);
for i=1:1:13
    c_2(i) = 10/3;
    c_3(i) = 80/3;
    c_4(i) = 890/3;
    c_5(i) = 7340/3;
    c_6(i) = 81590/3;
end
c = [c_1 c_2 c_3 c_4 c_5 c_6];

cc = zeros([1,13]);
for i=1:1:13
    cc(i) = 5;
end
c = [c cc]';

lb = zeros([65,1]);
ub = [];
z = zeros([65,1]);
for i=1:1:13  
    z(52+i) = 1;
end
[f,fval] = linprog(z,CC,c,kk,bb,lb,ub)