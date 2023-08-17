
% EXERCÍCIO 1 a)

function [fg,dfg,hg,dhg] = hermitegraf(n,M,f,df)


% definir função f a interpolar
if ~exist("M","var")
    M = 1;
end 

syms m 
sumf = symsum(f,m,1,M);
sumdf = symsum(df,m,1,M);

fnew = matlabFunction(sumf);
dfnew = matlabFunction(sumdf);

% valores de x
listax1 = ones(n+1,1);
for k = 0:n
    listax1(k+1) = (3*k)/n;
end

% valores de y
listay1 = arrayfun(fnew,listax1);


% polinómios de hermite
xq = linspace(-3,3,10^7);
h = pchip(listax1,listay1,xq);
polh = poly2sym(polyfit(xq,h,2*n+1));
dh = diff(polh);

% gráfico
grid on
hold on
fg = fplot(fnew,"b");
hg = plot(xq,h,"-r");
dfg = fplot(dfnew,"b--");
dhg = fplot(dh,"*r");
xlim([-3 3])
ylim([-2 5])
hold off

end


