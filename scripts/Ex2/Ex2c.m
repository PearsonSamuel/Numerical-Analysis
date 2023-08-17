
function[t] = Ex2c(N)
t=ones(2,1);
f= @(x) (cos(8*x)/18)*sum([1:36].*x-floor([1:36].*x)) ;
x=(2*pi/N)*[0:N-1];
y=arrayfun(f,x);
tic;
fourierd(y);
t(1)=toc;
tic;
fourierf(y); 
t(2)=toc;