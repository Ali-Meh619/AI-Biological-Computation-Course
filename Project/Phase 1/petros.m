function b=petros(x)



zcd = dsp.ZeroCrossingDetector

y=diff(x)*500;

p = size(double(zcd(y)),2);

n=log10(size(x,2));

s=log10(double(size(x,2)/(size(x,2)+0.4*p)));

b=n/(n+s);

end