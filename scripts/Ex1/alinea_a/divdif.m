
function [res] = divdif(f,X)

f = matlabFunction(f);
n = size(X,2);
u = zeros(n,n);

% valores de f(x)
y = arrayfun(f,X);
% valores de f'(x)
df = matlabFunction(diff(sym(f)));
dy = arrayfun(df,X);


% primeira coluna da matriz resposta = valores de f(x)
u(:,1) = y';

for j = 2:n
    for i = 1 : (n - j + 1) 
        if j==2
            if X(i) ~= X(i+1)
                u(i,j) = (u(i + 1, j - 1) - u(i, j - 1)) / (X(i + j - 1) - X(i));
            else 
                u(i,j) = dy(i);
            end
    
        else
            u(i,j) = (u(i + 1, j - 1) - u(i, j - 1)) / (X(i + j - 1) - X(i));
        end 
    end 
end
res = u;
end



















