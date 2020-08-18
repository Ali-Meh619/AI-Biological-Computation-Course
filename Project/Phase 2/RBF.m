
ff={};
for i=1:9

[idx,weights] = relieff(q1,libi(:,i),1000);
w=q1(:,idx)';
t=libi(:,i)';

c={};

for j=1:5

Q = size(w,2);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w1=w(1:40,ind1);
w2=w(1:40,ind2);



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

for i=1:9
    
   for j=1:5
       
    nn=ff{1,i}{j,1};
    
    yy=nn(ff{1,i}{j,3});
    
    m=double(yy>0.3);
    
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
rbfs{1,1}=ff{1,1}{3,1};
rbfs{1,2}=ff{1,2}{1,1};
rbfs{1,3}=ff{1,3}{2,1};

rbfs{1,4}=ff{1,4}{2,1};
rbfs{1,5}=ff{1,5}{1,1};
rbfs{1,6}=ff{1,6}{4,1};
rbfs{1,7}=ff{1,7}{4,1};
rbfs{1,8}=ff{1,8}{2,1};
rbfs{1,9}=ff{1,9}{2,1};
%%
tr(1,:)=ff{1,1}{3,4};
tr(2,:)=ff{1,2}{1,4};
tr(3,:)=ff{1,3}{2,4};

tr(4,:)=ff{1,4}{2,4};
tr(5,:)=ff{1,5}{1,4};
tr(6,:)=ff{1,6}{4,4};
tr(7,:)=ff{1,7}{4,4};
tr(8,:)=ff{1,8}{2,4};
tr(9,:)=ff{1,9}{2,4};
%%
o(1,:)=ff{1,1}{3,5};
o(2,:)=ff{1,2}{1,5};
o(3,:)=ff{1,3}{2,5};

o(4,:)=ff{1,4}{2,5};
o(5,:)=ff{1,5}{1,5};
o(6,:)=ff{1,6}{4,5};
o(7,:)=ff{1,7}{4,5};
o(8,:)=ff{1,8}{2,5};
o(9,:)=ff{1,9}{2,5};
%%
w=q1';
Q = size(w,2);
Q1 = floor(Q * 0.85);
Q2 = Q - Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1 + (1:Q2));


w1=w(1:40,ind1);
w2=w(1:40,ind2);



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

plotconfusion(u{2,2},u{2,1})
