function [HFD] = Higuchi_FD(serie, Kmax) 

N = length(serie); 
X = NaN(Kmax,Kmax,N);
for k = 1:Kmax
    for m = 1:k
        limit = floor((N-m)/k);
        j = 1;
        for i = m:k:(m + (limit*k))
            X(k,m,j) = serie(i);
            j = j + 1;
        end  
    end
end

L = NaN(1, Kmax);
for k = 1:Kmax
    L_m = zeros(1,k);
    for m = 1:k
        R = (N - 1)/(floor((N - m)/k) * k);
        aux = squeeze(X(k,m,logical(~isnan(X(k,m,:))))); 
        for i = 1:(length(aux) - 1)
            L_m(m) = L_m(m) + abs(aux(i+1) - aux(i));
        end
        L_m(m) = (L_m(m) * R)/k;
    end
    L(k) = sum(L_m)/k;
end

x = 1./(1:Kmax);
aux = polyfit(log(x),log(L),1);
HFD = aux(1); 
end
