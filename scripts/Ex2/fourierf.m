function[res] = fourierf(y)
N=length(y);
if N==2
    res = [y(1)+y(2),y(1)-y(2)];
else
    res=ones(N,1);
    yp=y(1:N/2)+y((N/2)+1:N);
    yi=(y(1:N/2)-y((N/2)+1:N)).*exp((-2*pi*1i/N).*[0:(N/2)-1]);
    res(1:2:N)= fourierf(yp); 
    res(2:2:N)=fourierf(yi);
end