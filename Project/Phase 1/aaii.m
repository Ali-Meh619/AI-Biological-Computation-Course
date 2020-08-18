clc
clear
%AI_Project


%%

for i=1:529
    
   if i<10
     kk=i;  
a='000'+string(kk);
b='A';
c='.hea';
d=strcat(b,a,c);
z=textread(d,'%s','delimiter','\n','whitespace','');
p1=z{14,1};
p2=z{15,1};
p3=z{16,1};

data(1,i)={p1(7:end)};
data(2,i)={p2(7:end)};
data(3,i)={p3(6:end)};

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
c='.hea';
d=strcat(b,a,c);
z=textread(d,'%s','delimiter','\n','whitespace','');
p1=z{14,1};
p2=z{15,1};
p3=z{16,1};

data(1,i)={p1(7:end)};
data(2,i)={p2(7:end)};
data(3,i)={p3(6:end)};   
       
   end    
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
c='.hea';
d=strcat(b,a,c);
z=textread(d,'%s','delimiter','\n','whitespace','');
p1=z{14,1};
p2=z{15,1};
p3=z{16,1};

data(1,i)={p1(7:end)};
data(2,i)={p2(7:end)};
data(3,i)={p3(6:end)};   
       
   end
    
    
    
end 
%%
clc;
clear;

lead(1).data={};
lead(2).data={};
lead(3).data={};
lead(4).data={};
lead(5).data={};
lead(6).data={};
lead(7).data={};
lead(8).data={};
lead(9).data={};
lead(10).data={};
lead(11).data={};
lead(12).data={};


    %%
for i=1:529
    
       if i<10
     kk=i;  
a='000'+string(kk);
b='A';
c='.mat';
d=strcat(b,a,c);
z=importdata(d);

for k=1:12
    
   r=lead(k).data;
   r{i,1}=z(k,:);
   lead(k).data=r;
   
end

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
c='.mat';
d=strcat(b,a,c);
z=importdata(d);

for k=1:12
    
   r=lead(k).data;
   r{i,1}=z(k,:);
   lead(k).data=r; 
end  
       
   end    
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
c='.mat';
d=strcat(b,a,c);
z=importdata(d);

for k=1:12
    
   r=lead(k).data;
   r{i,1}=z(k,:);
   lead(k).data=r; 
end  
       
   end
   
end
    

%%
for i=1:529
    
       if i<10
     kk=i;  
a='000'+string(kk);
b='A';
d=char(strcat(b,a));
ecgpuwave(d,'test');
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
peak{i,1}=pwaves;
peak{i,2}=signal;
peak{i,3}=tm;

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
d=char(strcat(b,a));
ecgpuwave(d,'test');
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
peak{i,1}=pwaves;
peak{i,2}=signal;
peak{i,3}=tm; 
       
   end 
   
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
d=char(strcat(b,a));
ecgpuwave(d,'test');
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
peak{i,1}=pwaves;
peak{i,2}=signal;
peak{i,3}=tm; 
       
   end
   
end

%%
clc
clear
wqr={};
%%
for i=1:529
    
       if i<10
     kk=i;  
a='000'+string(kk);
b='A';
d=char(strcat(b,a));
wqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
wqr{i,1}=pwaves;
wqr{i,2}=signal;
wqr{i,3}=tm;

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
d=char(strcat(b,a));
wqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
wqr{i,1}=pwaves;
wqr{i,2}=signal;
wqr{i,3}=tm;
       
   end 
   
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
d=char(strcat(b,a));
wqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
wqr{i,1}=pwaves;
wqr{i,2}=signal;
wqr{i,3}=tm; 
       
   end
   
end
%%
clc
clear
sqr={};
%%
for i=1:529
    
       if i<10
     kk=i;  
a='000'+string(kk);
b='A';
d=char(strcat(b,a));
sqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
sqr{i,1}=pwaves;
sqr{i,2}=signal;
sqr{i,3}=tm;

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
d=char(strcat(b,a));
sqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
sqr{i,1}=pwaves;
sqr{i,2}=signal;
sqr{i,3}=tm;
       
   end 
   
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
d=char(strcat(b,a));
sqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
sqr{i,1}=pwaves;
sqr{i,2}=signal;
sqr{i,3}=tm; 
       
   end
   
end
%%
for i=1:529
    
     if i<10
       
s='A'; 
     a='000'+string(i);
c='.mat';
d=strcat(s,a,c);
c=char(d);


[signal,Fs,tm]=rdsamp(c);
    ecgpuwave(c,'test');
    pwaves=rdann(c,'test',[],[],[]);
    if (isempty(pwaves)==0)
        threshhold=(mean(signal(pwaves))+2*max(signal(pwaves)))/3;
        indx=find(signal(pwaves)>threshhold);
        indx=indx(2:end-1);
        if length(indx)<3
            threshhold=(min(signal(pwaves,1))+2*max(signal(pwaves,1)))/3;
            indx=find(signal(pwaves,1)>threshhold);
            indx=indx(2:end-1);
        end
        if (isempty(indx)==0)
            
            RPeakt=pwaves(indx);
            QPeakt=pwaves(indx-1);
            SPeakt=pwaves(indx+1);
            QRSinterval=mean(SPeakt-QPeakt)/500;
            featureext(:,i,22)=QRSinterval;
            if (indx+4)<length(pwaves)
            TPeakt=pwaves(indx+4);
            QTinterval=mean(TPeakt-QPeakt)/500;
            featureext(:,i,21)=QTinterval;
            STinterval=mean(TPeakt-SPeakt)/500;
            featureext(:,i,23)=STinterval;
            end
            if (indx(1)-4)>1
            PPeakt=pwaves(indx-4);
            PRinterval=mean(QPeakt-PPeakt)/500;
            featureext(:,i,20)=PRinterval;
            end
            meanRpeak(i)=mean(signal(RPeakt,:));
            varRpeak(i)=var(signal(RPeakt,:));
            meanQpeak(i)=mean(signal(QPeakt,:));
            varQpeak(i)=var(signal(QPeakt,:));
            meanSpeak(i)=mean(signal(SPeakt,:));
            varSpeak(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQRS(i)=mean(signal(QPeakt(1):SPeakt(1),:));
            varQRS(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQT(i)=mean(signal(QPeakt(1):TPeakt(1),:));
            varQT(i)=var(signal(QPeakt(1):TPeakt(1),:));
            RRinterval(i)=mean(RPeakt(2:end)-RPeakt(1:end-1))/500;
            varRR(i)=var(RPeakt(2:end)-RPeakt(1:end-1));
            
        end
        
    end
    
     




   end
       
   if i>=10 && i<100
    s='A'; 
     a='00'+string(i);
c='.mat';
d=strcat(s,a,c);
c=char(d);


[signal,Fs,tm]=rdsamp(c);
    ecgpuwave(c,'test');
    pwaves=rdann(c,'test',[],[],[]);
    if (isempty(pwaves)==0)
        threshhold=(mean(signal(pwaves))+2*max(signal(pwaves)))/3;
        indx=find(signal(pwaves)>threshhold);
        indx=indx(2:end-1);
        if length(indx)<3
            threshhold=(min(signal(pwaves,1))+2*max(signal(pwaves,1)))/3;
            indx=find(signal(pwaves,1)>threshhold);
            indx=indx(2:end-1);
        end
        if (isempty(indx)==0)
            
            RPeakt=pwaves(indx);
            QPeakt=pwaves(indx-1);
            SPeakt=pwaves(indx+1);
            QRSinterval=mean(SPeakt-QPeakt)/500;
            featureext(:,i,22)=QRSinterval;
            if (indx+4)<length(pwaves)
            TPeakt=pwaves(indx+4);
            QTinterval=mean(TPeakt-QPeakt)/500;
            featureext(:,i,21)=QTinterval;
            STinterval=mean(TPeakt-SPeakt)/500;
            featureext(:,i,23)=STinterval;
            end
            if (indx(1)-4)>1
            PPeakt=pwaves(indx-4);
            PRinterval=mean(QPeakt-PPeakt)/500;
            featureext(:,i,20)=PRinterval;
            end
            meanRpeak(i)=mean(signal(RPeakt,:));
            varRpeak(i)=var(signal(RPeakt,:));
            meanQpeak(i)=mean(signal(QPeakt,:));
            varQpeak(i)=var(signal(QPeakt,:));
            meanSpeak(i)=mean(signal(SPeakt,:));
            varSpeak(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQRS(i)=mean(signal(QPeakt(1):SPeakt(1),:));
            varQRS(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQT(i)=mean(signal(QPeakt(1):TPeakt(1),:));
            varQT(i)=var(signal(QPeakt(1):TPeakt(1),:));
            RRinterval(i)=mean(RPeakt(2:end)-RPeakt(1:end-1))/500;
            varRR(i)=var(RPeakt(2:end)-RPeakt(1:end-1));
            
        end
        
    end
    
   end
   
   if i>=100
      s='A'; 
     a='0'+string(i);
c='.mat';
d=strcat(s,a,c);
c=char(d);


[signal,Fs,tm]=rdsamp(c);
    ecgpuwave(c,'test');
    pwaves=rdann(c,'test',[],[],[]);
    if (isempty(pwaves)==0)
        threshhold=(mean(signal(pwaves))+2*max(signal(pwaves)))/3;
        indx=find(signal(pwaves)>threshhold);
        indx=indx(2:end-1);
        if length(indx)<3
            threshhold=(min(signal(pwaves,1))+2*max(signal(pwaves,1)))/3;
            indx=find(signal(pwaves,1)>threshhold);
            indx=indx(2:end-1);
        end
        if (isempty(indx)==0)
            
            RPeakt=pwaves(indx);
            QPeakt=pwaves(indx-1);
            SPeakt=pwaves(indx+1);
            QRSinterval=mean(SPeakt-QPeakt)/500;
            featureext(:,i,22)=QRSinterval;
            if (indx+4)<length(pwaves)
            TPeakt=pwaves(indx+4);
            QTinterval=mean(TPeakt-QPeakt)/500;
            featureext(:,i,21)=QTinterval;
            STinterval=mean(TPeakt-SPeakt)/500;
            featureext(:,i,23)=STinterval;
            end
            if (indx(1)-4)>1
            PPeakt=pwaves(indx-4);
            PRinterval=mean(QPeakt-PPeakt)/500;
            featureext(:,i,20)=PRinterval;
            end
            meanRpeak(i)=mean(signal(RPeakt,:));
            varRpeak(i)=var(signal(RPeakt,:));
            meanQpeak(i)=mean(signal(QPeakt,:));
            varQpeak(i)=var(signal(QPeakt,:));
            meanSpeak(i)=mean(signal(SPeakt,:));
            varSpeak(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQRS(i)=mean(signal(QPeakt(1):SPeakt(1),:));
            varQRS(i)=var(signal(QPeakt(1):SPeakt(1),:));
            meanQT(i)=mean(signal(QPeakt(1):TPeakt(1),:));
            varQT(i)=var(signal(QPeakt(1):TPeakt(1),:));
            RRinterval(i)=mean(RPeakt(2:end)-RPeakt(1:end-1))/500;
            varRR(i)=var(RPeakt(2:end)-RPeakt(1:end-1));
            
        end
        
    end
       
   end 
    
    
end




%%
for i=1:529
    
       if i<10
     kk=i;  
a='000'+string(kk);
b='A';
d=char(strcat(b,a));
gqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
gqr{i,1}=pwaves;
gqr{i,2}=signal;
gqr{i,3}=tm;

   end
       
   if i>=10 && i<100
     kk=i;  
a='00'+string(kk);
b='A';
d=char(strcat(b,a));
gqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
gqr{i,1}=pwaves;
gqr{i,2}=signal;
gqr{i,3}=tm;
       
   end 
   
   if i>=100 
     kk=i;  
a='0'+string(kk);
b='A';
d=char(strcat(b,a));
gqrs(d);
[signal,Fs,tm]=rdsamp(d);
pwaves=rdann(d,'test',[],[],[]);
gqr{i,1}=pwaves;
gqr{i,2}=signal;
gqr{i,3}=tm; 
       
   end
   
end
%%
parfor j=1:12

for i=1:529
    
    
LE{j,i}=lyapunovExponent(lead(j).data{i,1},500);

end

end
%%
parfor j=1:12

for i=1:529
    
    
higuch{j,i}=higuchi(lead(j).data{i,1},3);

end

end
%%
parfor j=1:12

for i=1:529
    
    
kati{j,i}=katz(lead(j).data{i,1});

end

end
%%
parfor j=1:12

for i=1:529
    
    
stft{j,i}=stft(lead(j).data{i,1},500);

end

end
%%
parfor j=1:12

for i=1:529
    
    
skew{j,i}=skewness(lead(j).data{i,1},500);

end

end
%%
for j=1:12
    for i=1:529


    ECG_data =lead(j).data{i,2};
    [c,l] = wavedec(ECG_data,4,'db10');
    app4 = appcoef(c,l,'db10',4);
    det4 = detcoef(c,l,4);
    det3 = detcoef(c,l,3);
    det2 = detcoef(c,l,2);
    det1 = detcoef(c,l,1);
    wavi{j,i} = [mean(app4.^2),mean(det4.^2),mean(det3.^2),mean(det2.^2),mean(det1.^2)];
   
    
    end
end
%%
