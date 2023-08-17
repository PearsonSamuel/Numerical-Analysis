function[res] = fourierd(y)
N=length(y);
res=ones(N,1);
for l = 1:N
     res(l)= sum(y.*exp((-2*pi*i*(l-1)/N).*[0:(N-1)]));
end