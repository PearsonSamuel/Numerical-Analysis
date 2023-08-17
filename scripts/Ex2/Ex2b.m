function[p] = Ex2b(N)
p=0;
f= @(x) (cos(8*x)/18)*sum([1:36].*x-floor([1:36].*x)) ;
x=(2*pi/N)*[0:N-1];
y=arrayfun(f,x);
tf=zeros(N,1);
for l=1:N
    syms t
    tf(l)= sum(y.*exp((-2*pi*i*(l-1)/N).*[0:(N-1)]));
    p= p + tf(l)*exp(i*t*(l-1));
end
p=(1/N)*p;
p=matlabFunction(p);
hold on
plot(x,y, "o")
z=linspace(x(1),x(N),1000*N);
plot(z,p(z),"black")
hold off
end
