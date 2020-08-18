
feature={};
n=[];
%%
for i=1:529
    
   for j=1:12
       
      n=[wavi{1,i}(j,:) n];
       
       
       
   end
    feature{1,i}=n;
    n=[];
    
    
end
%%
for i=1:529
    
   for j=1:12
       
      n=[medfreq(patien{1,i}(j,:),500) n];
       
   end
   
   feature{2,i}=n;
   n=[];
    
end
%%
for i=1:529
    
   for j=1:12
       
      n=[meanfreq(patien{1,i}(j,:),500) n];
       
   end
   
   feature{3,i}=n;
   n=[];
    
end
%%
for i=1:529
    
   for j=1:12
       
      x=patien{1,i}(j,:);

   z=stft(x,500);

  n=[sqrt(max(sum(abs(z)))) n]; 
       
   end
    feature{4,i}=n;
   n=[];
    
    
    
    
end
%%

for i=1:529
    
    
   feature{6,i}=HDF(:,1)';
   feature{7,i}=KFD(:,1)';
   feature{8,i}=LE(:,1)';
    
end
%%
for i=1:529
    
   for j=1:12
    
   a(1,j)=skewness(patien{1,i}(j,:));
   
    
    
end

feature{9,i}=a;
a=[];
end
%%

for i=1:16
    
   feach=[feach saveQRS(:,:,i)']; 
    
end
%%
feach=[feach a'];

%%
feach=[];
n1=[];
%%
for i=1:529
   for j=1:9 
    
       n1=[feature{j,i} n1];
       
       
       
   end
   feach=[n1;feach];
   n1=[];
   
end


%%
for j=1:9
for i=1:529
    
  if data{4,i}==j
      
      libi(i,j)=1;
      
  else
     libi(i,j)=0; 
  end
      
      
    
    
end
end

%%

for j=1:9
    
[idx(j,:),weights] = relieff(feach,libi(:,j),1000);

end

%%
feach=transpose(mapminmax(feach',-1,1));
%%
for i=1:9
    
   e(:,:,i)=feach(:,idx(i,:)); 
    
end
%%
f1=e(110:529,:,i);
f2=e(1:109:end,:,i);
l1=libi(110:529,i);
l2=libi(1:109,i);

%%
f1=f1(:,1:9);
f2=f2(:,1:9);


%%
for i=1:9
    
f1=e(110:529,:,i);
f2=e(1:109:end,:,i);
l1=libi(110:529,i);
l2=libi(1:109,i);

f1=f1(:,1:9);
f2=f2(:,1:9);
    
opt = genfisOptions('FCMClustering');
opt.MaxNumIteration=1000;

y=genfis(f1,l1,opt);

tuningOpt = tunefisOptions;
tuningOpt.KFoldValue = 5;
tuningOpt.ValidationWindowSize = 3;
tuningOpt.ValidationTolerance = 0.008;
tuningOpt.UseParallel=true;
[in,out,rule] = getTunableSettings(y);
[fisout,x] = tunefis(y,[in;out],f1,l1,tuningOpt);
output(i).data{1,1}=fisout;
output(i).data{1,2}=x;


end
%%
for i=1:9
    
f1=e(110:529,:,i);
f2=e(1:109:end,:,i);
l1=libi(110:529,i);
l2=libi(1:109,i);


f1=f1(:,1:4);
f2=f2(:,1:4);

opt = anfisOptions('InitialFIS',7);
opt.EpochNumber=10;
opt.ValidationData=[f2 l2]
[x,y2(i)]=anfis([f1 l1],opt);
out(i).data=x;
end
%%
for i=1:9
    
    
f1=e(110:529,:,i);
f2=e(1:109:end,:,i);
l1=libi(110:529,i);
l2=libi(1:109,i);


f1=f1(:,1:4);
f2=f2(:,1:4);

tuningOpt = tunefisOptions;
tuningOpt.KFoldValue = 5;
tuningOpt.ValidationWindowSize = 3;
tuningOpt.ValidationTolerance = 0.008;
tuningOpt.UseParallel=true;
[in,outt,rule] = getTunableSettings(out(i).data);
[fisout,x] = tunefis(out(i).data,[in;outt],f1,l1,tuningOpt);
anfsout(i).data{1,1}=fisout;
anfsout(i).data{1,2}=x;
 
    
    
end

%%
for i=1:9
    
    f2=e(421:end,:,i);
    f2=f2(:,1:9);
    
   c0(:,i)=evalfis(output(i).data{1,1},f2); 
    
 
 
end
%%
a1=(c0<=0.2);
a2=~a1;
g=c0;
g(a1)=0;
g(a2)=1;
%%
for i=1:9
    
    f2=e(421:end,:,i);
    f2=f2(:,1:4);
    
   c1(:,i)=evalfis(out(i).data,f2); 
    
 
 
end
%%
a1=(c1<=0.2);
a2=~a1;
o=c1;
o(a1)=0;
o(a2)=1;
%%
plotconfusion(l2',o')