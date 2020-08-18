%%
%normal

a=nonzeros(b(1,:))';
x={'med-freq','mean-freq','Katz','lyapanov','skewness','mean-RPeaks','mean-SPeaks','var-SPeaks','var-QRS','mean-QT'}
pie(a,x)
title('Normal')



%%
a=nonzeros(b(2,:))';
x={'var-RPeaks','mean-QPeaks','var-SPeak','var-QT','mean-PRinterval','mean-QTinterval','var-RRinterval','S-Entropy'}
pie(a,x)
title('AF')
%%
a=nonzeros(b(3,:))';
x={'Katz','STFT','med-freq','HF-Energy','higuchi','mean-QTinterval','lyapanov','Skewness','mean-SPeaks','mean-PRinterval','LF-Energy'}
pie(a,x)
title('I-AVB')
%%
a=nonzeros(zz)';
x={'mean-RPeaks','var-QPeaks','var-SPeaks','mean-QRS','var-QRS','var-QT','mean-QRSint','var-QRS','var-RRint'}
pie(a,x)
title('LBBB')
%%
zz=zeros(1,29);

for i=1:29
    [q,r]=quorem(sym(rank(2,i)),sym(12));
    q=double(q);
    
    zz(double(q+1))=zz(double(q+1))+1;
end

%%
a=nonzeros(b(5,:))';
x={'mean-QPeaks','var-QPeaks','var-SPeaks','mean-QRS','var-QRS','mean-QRSint','mean-STint','Entropy'}
pie(a,x)
title('RBBB')
%%
a=nonzeros(b(6,:))';
a(14)=[];
x={'HF-Energy','LF-Energy','mran-freq','STFT','Higuchi','Katz','lyapanov','mean-R','var-R','var-Q','var-S','var-QRS','Entropy'}
pie(a,x)
title('PAC')
%%
a=nonzeros(b(7,:))';
x={'mean-S','mean-QRSint','Higuchi','var-SPeaks','mean-QRS','var-QRS','var-QTint','mean-QTint','var-Q'}
pie(a,x)
title('PVC')
%%
a=nonzeros(b(8,:))';
x={'mean-R','mean-S','var-SPeaks','mean-QRS','var-QRS','var-QTint','Entropy'}
pie(a,x)
title('STD')
%%
a=nonzeros(b(9,:))';
x={'mean-R','mean-S','var-S','mean-QRS','var-QRS','mean-QTint','var-QTint'}
pie(a,x)
title('STE')
%%
for i=1:9
    
for j=1:529
    
    if data{4,j}==i
        
        libi(j,i)=1;
    else
        libi(j,i)=0;
    end
end
end
%%

%%
for i=1:9
[rank(i,:),w]=relieff(feach,libi(:,i),1000);
end

