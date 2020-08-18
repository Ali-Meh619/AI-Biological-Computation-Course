

r=q1(:,1:30);
e=randperm(30);
r=r(:,e);

%%
%generate random population
a=randi([0 1],4,30);

%%

for z=1:150
    
    for i=1:4
        
       xb(i,1)=fitness(r,libi,logical(a(i,:)));
       xb(i,2)=1.5*i;%evaluate fitness
       
    end
    
 [m,n]=min(xb(:,1));
 
 jj(1,:)=a(n,:);
 

 
 a(n,:)=[];
 xb(n,:)=[];
 
 [xb(:,1),qq]=sort(xb(:,1),'descend');%ranking
 
 b=rw(xb(:,2));
 
 jj(2,:)=a(qq(b),:);
 
 %mutation and crossover
 jj(3,:)=mutation(crossover(jj(1,:),jj(2,:),0.5),0.1);
 jj(4,:)=mutation(crossover(jj(1,:),jj(2,:),0.5),0.1);
 
 a(1,:)=jj(1,:);
 a(2,:)=jj(2,:);
 a(3,:)=jj(3,:);
 a(4,:)=jj(4,:);
  
    
end
%%
%training
ff={};
for i=1:9


w=q1(:,1:30)';
t=libi(:,i)';

c={};

for j=1:5

Q = size(w,2);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w1=w(logical(a(1,:)),ind1);
w2=w(logical(a(1,:)),ind2);



t1=t(ind1);
t2=t(ind2);
    
net = newgrnn(w1,t1);    
    
   c{j,1}=net;
   c{j,3}=w2;
   c{j,4}=t2;
    
    
end
ff{1,i}=c;
c={};

end
%%
%output
for i=1:9
    
   for j=1:5
       
    nn=ff{1,i}{j,1};
    
    yy=nn(ff{1,i}{j,3});
    
    m=double(yy>0.3);
    
    ff{1,i}{j,5}=m;
       
       
   end
    
    
end
%%
%accuracy
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
%test
w=q1';
Q = size(w,2);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w11=w(1:30,ind1);
w1=w11(logical(a(1,:)));

w22=w(1:30,ind2);
w2=w22(logical(a(1,:)));


t1=libi(ind1,:);
t2=libi(ind2,:);
%%

o=[];
tr=[];
parfor i=1:9

[idx,weights] = relieff(q1,libi(:,i),1000);
w=q1(:,idx)';
t=libi(:,i)';
w1=w(1:40,ind1);
w2=w(1:40,ind2);
t1=t(ind1);
t2=t(ind2);

tr=[t2;tr];

net=rbfs{1,i};

y=net(w2);

m=double(y>0.3);

o=[m;o];
end
%%
%test plot confusion
plotconfusion(u{2,2},u{2,1})


%%
%%%%%%functions%%%%%

%fitness and training
function score=fitness(q1,libi,idx)


o=[];
tr=[];

w=q1(:,idx)';

Q = size(w,2);
Q1 = floor(Q * 0.8);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));

for i=1:9

t=libi(:,i)';





w1=w(:,ind1);
w2=w(:,ind2);



t1=t(ind1);
t2=t(ind2);
    
net = newgrnn(w1,t1);    
    
   yy=net(w2);

    m=double(yy>0.3);
    

o=[m;o];

tr=[t2;tr];


   
end

[score,cm,ind,per] = confusion(tr,o);

end

%crossover
function qq=crossover(x1,x2,p)

qq=[];

for i=1:length(x1)
    
 if rand<p
     
     qq=[x1(i) qq];
     
 else
     
     qq=[x2(i) qq];
    
 end


end

end

%mutation
function ee=mutation(x,p)

for j=1:length(x)
    
   if rand<p
       
       x(j)=~x(j);
    
    
end

end

ee=x;

end

%roulette wheel selection
function [index] =  rw(arrayInput)
len = length(arrayInput);

if (~isempty(find(arrayInput<1, 1)))
    if (min(arrayInput) ~=0)
    arrayInput = 1/min(arrayInput)*arrayInput;
    else
    temp= arrayInput;
    temp(arrayInput==0) = inf;
    arrayInput = 1/min(temp)*arrayInput;
    end
end
temp = 0;
tempProb = zeros(1,len);
for i= 1:len
    tempProb(i) = temp + arrayInput(i);
    temp = tempProb(i);
end
i = fix(rand*floor(tempProb(end)))+1;
index = find(tempProb >= i, 1 );
end