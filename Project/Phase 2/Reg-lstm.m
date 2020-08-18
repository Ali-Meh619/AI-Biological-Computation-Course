

jkk=[2 2 2 7 2 2 2 2 7];
wt={};
for pu=1:9
    
w=q1';
t=libi(:,pu);
    


b=t>0;
x=sum(t);
oo=w(:,b);
too=t(b);
for i=1:jkk(pu)
    
   w=[w oo];
   t=[t;too];
   
end

ty=size(w,2);
pk=randperm(ty);
w=w(:,pk);
t=t(pk);

wt{1,pu}=w;
wt{2,pu}=t;
end
%% 
   lstM={};
parfor e1=1:9
ee={};

w=wt{1,e1};
t=wt{2,e1};

for i=1:size(w,2)
    
   if t(i)==0
       
      t(i)=-1;
      
   elseif t(i)==1
       
       t(i)=1;
   end
    
end

for kk=1:5

Q = size(w,2);
Q1 = floor(Q * 0.90);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w1=w(1:20,ind1);
w2=w(1:20,ind2);
%w1=mapminmax(w1);
%w2=mapminmax(w2);


t1=t(ind1);
t2=t(ind2);

x1={};

for i=1:Q1
    
   x1{i,1}=w1(:,i)'; 
end
qp=[];

for i=1:20
    qp=[t1 qp];
end
c={};

for j=1:Q1
  r1=1:1:20;
  r2=-1:-1:-20;
    if t1(j)==-1
c{j,1}=r2;

    elseif t1(j)==1
        c{j,1}=r1;
    end

end


y1=categorical(t1);

inputSize =1;
numHiddenUnits =80;
numClasses = 1;
layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    regressionLayer]

maxEpochs = 160;
miniBatchSize =30;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'LearnRateSchedule','piecewise', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false);

[net,x] = trainNetwork(x1,c,layers,options);

x2={};
for i=1:Q2
    
   x2{i,1}=w2(:,i)'; 
end

gg=predict(net,x2);


nn=t2>0;

yyy=[];

for i=1:Q2
   a=gg{i,1};
   h=mean(a);
   yyy(i,1)=h;
    
end

bb=double(yyy>0)

a1=nn==bb;


ee{kk,1}=net;
ee{kk,2}=x;
ee{kk,3}=x2;
ee{kk,4}=t2;
ee{kk,5}=sum(a1)/size(a1,1);

end

lstM{1,e1}=ee;
ee={};


end

%%
lstm{1,1}=lstM{1,1}{3,1};
lstm{1,2}=lstM{1,2}{5,1};
lstm{1,3}=lstM{1,3}{2,1};
lstm{1,4}=lstM{1,4}{1,1};
lstm{1,5}=lstM{1,5}{1,1};

lstm{1,6}=lstM{1,6}{1,1};
lstm{1,7}=lstM{1,7}{4,1};
lstm{1,8}=lstM{1,8}{5,1};
lstm{1,9}=lstM{1,9}{4,1};
%%

tl1=lstM{1,1}{3,2}.TrainingLoss;


tl2=lstM{1,2}{5,2}.TrainingLoss;


tl3=lstM{1,3}{2,2}.TrainingLoss;

tl4=lstM{1,4}{1,2}.TrainingLoss;


tl5=lstM{1,5}{1,2}.TrainingLoss;

tl6=lstM{1,6}{1,2}.TrainingLoss;


tl7=lstM{1,7}{4,2}.TrainingLoss;


tl8=lstM{1,8}{5,2}.TrainingLoss;


tl9=lstM{1,9}{4,2}.TrainingLoss;

%%
plot(x,tl1)
ylim([0 100])
title('Training Loss(1)')
xlabel('Epochs')
ylabel('Loss')

%%


best_lstm{1,1}=tr;
best_lstm{1,2}=o;

plotconfusion(best_lstm{1,1},best_lstm{1,2})