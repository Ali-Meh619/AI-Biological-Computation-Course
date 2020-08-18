function [KFD] = Katz_FD(serie)

L = 0;
N = length(serie);
n = N - 1;  
for i = 1:(N - 1)
    aux = sqrt(1 + ((serie(i) - serie(i+1))^2));
    L = L + aux;
    clear('aux');
end

for i = 2:N
    dist(i) = sqrt(((1 - i)^2) + ((serie(1) - serie(i))^2));
end
d = max(dist);
KFD = log10(n)/(log10(n) + log10(d/L));
end