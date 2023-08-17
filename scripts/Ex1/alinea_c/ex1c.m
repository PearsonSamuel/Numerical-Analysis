

syms z m
myf = 1/(3*z.^2 + 3 + m*log(m));
mydf = -(6*z)/(3*z.^2 + 3 + m*log(m)).^2;

hermitegraf(10,10,myf,mydf)