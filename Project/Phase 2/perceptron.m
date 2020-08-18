
ff={};
for i=1:9

[idx,weights] = relieff(q1,libi(:,i),1000);
w=q1(:,idx)';
t=libi(:,i)';

c={};

for j=1:5
net = patternnet(12);
net.divideParam.trainRatio = 85/100;
net.divideParam.valRatio = 7.5/100;
net.divideParam.testRatio = 7.5/100;

Q = size(w,2);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w1=w(1:70,ind1);
w2=w(1:70,ind2);



t1=t(ind1);
t2=t(ind2);
    
    for k=1:3
        
            
     [net,x] = train(net,w1,t1);   
        
        
        
        
    end
    
   c{j,1}=net;
   c{j,2}=x;
   c{j,3}=w2;
   c{j,4}=t2;
    
    
end
ff{1,i}=c;
c={};

end
%%

for i=1:9
    
   for j=1:5
       
    nn=ff{1,i}{j,1};
    
    yy=nn(ff{1,i}{j,3});
    
    m=double(yy>0.2);
    
    ff{1,i}{j,5}=m;
       
       
   end
    
    
end
%%
for i=1:9
    
    for j=1:5

a1=ff{1,i}{j,4};
a2=ff{1,i}{j,5};

v=double(a1==a2);

b=sum(v)/length(v);

ff{1,i}{j,6}=b;

    end
end
%%
percep{1,1}=ff{1,1}{3,1};
percep{1,2}=ff{1,2}{2,1};
percep{1,3}=ff{1,3}{2,1};

percep{1,4}=ff{1,4}{1,1};
percep{1,5}=ff{1,5}{5,1};
percep{1,6}=ff{1,6}{5,1};
percep{1,7}=ff{1,7}{5,1};
percep{1,8}=ff{1,8}{4,1};
percep{1,9}=ff{1,9}{5,1};
%%

plotperf(ff{1,1}{3,2})
%%

plotperf(ff{1,2}{2,2})
%%

plotperf(ff{1,3}{2,2})
%%

plotperf(ff{1,4}{1,2})
%%

plotperf(ff{1,5}{5,2})
%%

plotperf(ff{1,6}{5,2})
%%

plotperf(ff{1,7}{5,2})
%%

plotperf(ff{1,8}{4,2})
%%

plotperf(ff{1,9}{5,2})

%%
plotconfusion(u{1,2},u{1,1})
