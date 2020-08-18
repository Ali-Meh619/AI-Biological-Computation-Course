lstmm={};

parfor qq=1:9
    
[idx,weights] = relieff(q1,libi(:,qq),1000);
w=q1(:,idx)';
t=libi(:,qq)';
    
ee={};

w=q1';
t=libi(:,qq);

for kk=1:5

Q = size(w,2);
Q1 = floor(Q * 0.85);
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

for i=1:449
    
   x1{i,1}=w1(:,i)'; 
end
y1=categorical(t1);

inputSize =1;
numHiddenUnits =70;
numClasses = 2;

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]

maxEpochs = 100;
miniBatchSize =30;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'LearnRateSchedule','piecewise', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false);

[net,x] = trainNetwork(x1,y1,layers,options);

x2={};
for i=1:80
    
   x2{i,1}=w2(:,i)'; 
end

yy = classify(net,x2,'MiniBatchSize',miniBatchSize);

acc = sum(yy ==categorical(t2))./numel(yy)

ee{kk,1}=net;
ee{kk,2}=x;
ee{kk,3}=x2;
ee{kk,4}=categorical(t2);
ee{kk,5}=acc;

end
lstmm{1,qq}=ee;
ee={};
end
%%
lstm{1,1}=lstmm{1,1}{1,1};
lstm{1,2}=lstmm{1,2}{3,1};
lstm{1,3}=lstmm{1,3}{2,1};
lstm{1,4}=lstmm{1,4}{1,1};
lstm{1,5}=lstmm{1,5}{2,1};

lstm{1,6}=lstmm{1,6}{3,1};
lstm{1,7}=lstmm{1,7}{1,1};
lstm{1,8}=lstmm{1,8}{3,1};
lstm{1,9}=lstmm{1,9}{1,1};
%%
ta1=lstmm{1,1}{1,2}.TrainingAccuracy;
tl1=lstmm{1,1}{1,2}.TrainingLoss;

ta2=lstmm{1,2}{3,2}.TrainingAccuracy;
tl2=lstmm{1,2}{3,2}.TrainingLoss;

ta3=lstmm{1,3}{2,2}.TrainingAccuracy;
tl3=lstmm{1,3}{2,2}.TrainingLoss;

ta4=lstmm{1,4}{1,2}.TrainingAccuracy;
tl4=lstmm{1,4}{1,2}.TrainingLoss;

ta5=lstmm{1,5}{2,2}.TrainingAccuracy;
tl5=lstmm{1,5}{2,2}.TrainingLoss;

ta6=lstmm{1,6}{3,2}.TrainingAccuracy;
tl6=lstmm{1,6}{3,2}.TrainingLoss;

ta7=lstmm{1,7}{1,2}.TrainingAccuracy;
tl7=lstmm{1,7}{1,2}.TrainingLoss;

ta8=lstmm{1,8}{3,2}.TrainingAccuracy;
tl8=lstmm{1,8}{3,2}.TrainingLoss;

ta9=lstmm{1,9}{1,2}.TrainingAccuracy;
tl9=lstmm{1,9}{1,2}.TrainingLoss;
%%
x=1:1:1400;

plot(x,ta5)
ylim([0 100])
title('Training Accuracy(5)')
xlabel('Epochs')
ylabel('Acc')
%%
plot(x,tl1)
ylim([0 2])
title('Training Loss(5)')
xlabel('Epochs')
ylabel('Loss')
%%

w=q1';


o=[];
tr=[];

for i=1:9
   net=lstm{1,i};


   for j=1:529
  
   x2{j,1}=w(1:20,j)'; 
end

yy = classify(net,x2);
y1=string(yy');
n{i,1}=yy;
tr=[libi(:,i)';tr];
o=[double(y1);o];

end
%%
m1=string(yy');
m3=double(m1);
m2=libi(:,1)';

plotconfusion(m2,o(1,:))
%%
w=q1';

for k=1:529
   xx{k,1}=w(1:20,k)';
    
end

%%
yy = classify(lstmm{1,9}{1,1},xx);
acc = sum(yy ==categorical(libi(:,1)))./numel(yy)
