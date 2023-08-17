
function [plot] = graficoH(n,M,f,df)

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


% polinómios de hermite
h = Hermite(sumf,listax1);
dh = diff(h);
haux = matlabFunction(h);
dhaux = matlabFunction(dh);


% gráfico
grid on
hold on
fplot(fnew,"b")
fplot(dfnew,"b--")
fplot(haux,"or")
fplot(dhaux,"og")
xlim([0 3])
hold off


% erro absoluto
xx = linspace(-3,3,1000);
yyf = arrayfun(fnew,xx);
yyh = arrayfun(haux,xx);

er = max(abs(yyf - yyh));
disp(er)



end 



