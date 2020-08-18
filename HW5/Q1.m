clc;
clear;
k=-pi:0.01:3*pi/2;
n=length(k);
u1=(sqrt(2)*sin(k)+cos(k))';
u2=(0.1*u1.^3)';
f=[0 0 u1(1) u2(1)];
t=[0];
for i=2:n
   f1=zeros(1,4);
   f1(3)=u1(i);
   f1(4)=u2(i);
   f1(2)=0.4.*f(i-1,1);
   f1(1)=0.1.*t(i-1);
   t1=sum(f1);
   t=[t;t1];
   f=[f;f1];
end
%%
v1=10*f(:,1);
v2=2.5*f(:,2);

f=[v1 v2 u1];
%%
% 5 neuron
    
net1 = fitnet(5);
net1.divideParam.trainRatio = 80/100;
net1.divideParam.valRatio = 5/100;
net1.divideParam.testRatio = 15/100;
   

  

[net1,x] = train(net1,f',t');
%%
yy=net1(f');

plot(u1,yy,u1,t);

legend('Training data','Aproximated data')

title('One hidden layer with size=5')

%%
% 10 neuron

net2 = fitnet(10);
net2.divideParam.trainRatio = 80/100;
net2.divideParam.valRatio = 5/100;
net2.divideParam.testRatio = 15/100;
   

  

[net2,x] = train(net2,f',t');
%%
yy=net2(f');

plot(u1,yy,u1,t);

legend('Training data','Aproximated data')

title('One hidden layer with size=10')
%%
% 2 layers network
net3 = fitnet([4,6]);
net3.divideParam.trainRatio = 80/100;
net3.divideParam.valRatio = 5/100;
net3.divideParam.testRatio = 15/100;
     

[net3,x] = train(net3,f',t');
%%
yy=net3(f');

plot(u1,yy,u1,t);

legend('Training data','Aproximated data')

title('Two hidden layers with size=[4,6]')

%%
%RBF
Q = size(f,1);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));

f1=f(ind1,:)';
f2=f(ind2,:)';
t1=t(ind1)';
t2=t(ind2)';

net4=newrbe(f1,t1);

nj=net4(f2);

ee=immse(nj,t2)
%%
yy=net3(f');

plot(u1,yy,u1,t);

legend('Training data','Aproximated data')

title('RBF neural Net')