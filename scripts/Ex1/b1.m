function res=b1(n,M,f,df)

% definir função f a interpolar
if ~exist("M","var")
    M = 1;
end 

syms m
f = symsum(f,m,1,M);
df = symsum(df,m,1,M);

faux = matlabFunction(f);
dfaux = matlabFunction(df);

% valores de x, f(x)=y e f'(x)=dy
xlist = ones(n+1,1);
ylist = ones(n+1,1);
dylist = ones(n+1,1);
for k=0:n
    xlist(k+1) = (3*k)/n;
    ylist(k+1) = faux(xlist(k+1));
    dylist(k+1) = dfaux(xlist(k+1));
end

h=3/n; %passo (constante)

M=zeros(n+1); %Matriz usada na determinação dos coeficientes (s''0,...,s''n)

M(1,1) = h/3;
M(n+1,end) = h/3;
M(1,2) = h/6;
M(n+1,end-1) = h/6;

flist = ones(n+1,1); %(f1-f0-f'0, f2-f1 - (f1-f0),...)

flist(1) = (ylist(2)-ylist(1))/h - dylist(1);
flist(end) = dylist(end) - (ylist(end)-ylist(end-1))/h;

for k=2:n
    M(k,k-1)=h/6;
    M(k,k+1)=h/6;
    M(k,k)=2*h/3;
    flist(k) = ((ylist(k+1)-ylist(k)) - (ylist(k)-ylist(k-1)))/h;
end

dds=linsolve(M,flist); %(s''0,s''1,...,s''n)

ds=ones(n+1,1); %(s'0,...,s'n)
ds(1) = (ylist(2)-ylist(1))/h - h/3*dds(1) - h/6*dds(2);
ds(end) = (ylist(end) - ylist(end-1))/h + h/3*dds(end) + h/6*dds(end-1);
for k=2:n
    ds(k)=ds(k-1)+h*(dds(k-1) + (dds(k)-dds(k-1))/2); 
end

%Gráfico (separamos em intervalos xk,xk+1 com k=0,...,n-1
syms z
erromax = 0; %erro absoluto máximo
hold on
plot(linspace(0,3,1000),arrayfun(faux,linspace(0,3,1000)),'r') %gráfico da função real f, para comparação
for k=1:n
    c=linspace(xlist(k),xlist(k+1),100);
    s=ylist(k) + (z-xlist(k))*ds(k) + dds(k)/2*(z-xlist(k))^2 + (dds(k+1)-dds(k))/(6*h)*(z-xlist(k))^3; %expressão do spline no intervalo
    s=matlabFunction(s); %spline como função
    a=arrayfun(s,c);
    plot(c,a) %gráfico
    b=max(abs( a-arrayfun(faux,c))); %b é o erro absoluto máximo no interalo em questão
    if b > erromax
        erromax=b;
    end
end
hold off

disp(erromax)

end