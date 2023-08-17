
function [res] = Hermite(f,X)

fnew = matlabFunction(f);

n = length(X);
fx0 = fnew(X(1));

% valores de f'(x)
df = diff(f);
dy = arrayfun(matlabFunction(df),X);

% vetor com todos os f(X) e f'(X)
Z = ones(1,2*n);
for w = 1:n
    Z(2*w-1) = X(w);
    Z(2*w) = X(w);
end 

% matriz diferenças divididas
mdd = divdif(f,Z);


% polinómio de hermite
pol = fx0;
mult = 1;

for k = 1:2*n-1
    syms t
    mult = mult*(t-Z(k));
    pol = pol + mdd(1,k+1)*mult;
end 

res = pol;
end



