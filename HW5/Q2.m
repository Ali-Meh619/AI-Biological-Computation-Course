% 3 membership function,TSK with order=1
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 3;
genOpt.InputMembershipFunctionType = 'gaussmf';
inFIS = genfis(x,y,genOpt);

opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
p=immse(yy,y);
plot(x,y,x,evalfis(outFIS,x))
title('3 membership function,TSK with order=1, MSE='+string(p))
legend('Training Data','ANFIS Output')
immse(yy,y)
%%
% 5 membership function,TSK with order=1
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 5;
genOpt.InputMembershipFunctionType = 'gaussmf';
inFIS = genfis(x,y,genOpt);


opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
p=immse(yy,y);
plot(x,y,x,evalfis(outFIS,x))
legend('Training Data','ANFIS Output')
title('5 membership function,TSK with order=1, MSE='+string(p))
immse(yy,y)
%%
% 5 membership function,TSK with order=0
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 5;
genOpt.InputMembershipFunctionType = 'gaussmf';
genOpt.OutputMembershipFunctionType='constant';
inFIS = genfis(x,y,genOpt);


opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
immse(yy,y)
p=immse(yy,y);
plot(x,y,x,evalfis(outFIS,x))
legend('Training Data','ANFIS Output')
title('5 membership function,TSK with order=0, MSE='+string(p))



%%
% 3 membership function,TSK with order=0
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 3;
genOpt.InputMembershipFunctionType = 'gaussmf';
genOpt.OutputMembershipFunctionType='constant';
inFIS = genfis(x,y,genOpt);


opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
p=immse(yy,y);

plot(x,y,x,evalfis(outFIS,x))
legend('Training Data','ANFIS Output')
title('3 membership function,TSK with order=0, MSE='+string(p))
immse(yy,y)
%%
% 3 membership function,mamdani
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 3;
genOpt.InputMembershipFunctionType = 'gaussmf';
genOpt.OutputMembershipFunctionType='constant';
inFIS=genfis(x,y,genOpt);

inFIS.AndMethod='min'; 
inFIS.OrMethod='max'; 


opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
p=immse(yy,y);

plot(x,y,x,evalfis(outFIS,x))
legend('Training Data','ANFIS Output')
title('3 membership function,mamdani, MSE='+string(p))
immse(yy,y)
%%
% 5 membership function,mamdani
clc
clear
x = (-10:0.1:10)';
y = x+0.1*(x.^3);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions =5;
genOpt.InputMembershipFunctionType = 'gaussmf';
genOpt.OutputMembershipFunctionType='constant';
inFIS=genfis(x,y,genOpt);

inFIS.AndMethod='min'; 
inFIS.OrMethod='max'; 


opt = anfisOptions('InitialFIS',inFIS);
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;


outFIS = anfis([x y],opt);

yy=evalfis(outFIS,x);
p=immse(yy,y);
plot(x,y,x,evalfis(outFIS,x))
legend('Training Data','ANFIS Output')

title('5 membership function,mamdani, MSE='+string(p))
immse(yy,y)