
% EXERCÍCIO 1 a)

syms z m
myf = 1/(3*z.^2 + 3 + m*log(m));
mydf = -(6*z)/(3*z.^2 + 3 + m*log(m)).^2;

graficoH(n,M,myf,mydf)
% escolher n e M

