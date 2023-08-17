function res=D2(eps)

n=20;

h=eps/floor(n/2); %passo a ser usado
%Nota: se n par usamos n+1 pontos de quadratura diferentes, caso contrário n

f=@(xk) cos(8*xk)/18 * sum((1:36)*xk - floor((1:36)*xk));

syms y
x1=y-eps:h:y; %pontos de quadratura para o integral de y-eps a y
x2=y:h:y+eps; %Análogo para o integral de y a y+eps

%Valores de f nesses pontos:
f1=arrayfun(f,x1);
f2=arrayfun(f,x2);

T1=h*(f1(1)/2 + f1(end)/2); %Guardará o valor da aproximação do primeiro integral pela regra dos trapézios composta
T2=h*(f2(1)/2 + f2(end)/2); %Análogo para o segundo integral
for k = 2:length(f1)-1
    T1 = T1+ h*f1(k);
    T2 = T2+ h*f2(k);
end

res=matlabFunction((-1/eps^2)*( T1 - T2)); %função que aproxima f'

%Gráfico da função entre 0 e 2pi:
c=linspace(0,2*pi,1000);
plot(c,arrayfun(res,c))

end