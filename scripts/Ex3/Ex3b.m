function [f2vals,f2real_vals,erro_abs,majorante_erro]=Ex3b(h,b)

if b==1 %o input b indica qual a função f a ser considerada
    f=(@(x) cos(3*x^2+5*x));
    d2f=(@(x) -6*sin(3*x^2 + 5*x) - cos(3*x^2 + 5*x)*(6*x + 5)^2);
    d4f=(@(x) cos(3*x^2 + 5*x)*(6*x + 5)^4 - 108*cos(3*x^2 + 5*x) + 24*sin(3*x^2 + 5*x)*(6*x + 5)^2 + sin(3*x^2 + 5*x)*(6*x + 5)*(72*x + 60));
else
    f=@(x) sin(x^4)/x;
    d2f=@(x) 4*x*cos(x^4) + (2*sin(x^4))/x^3 - 16*x^5*sin(x^4);
    d4f=@(x) (24*sin(x^4))/x^5 - 896*x^7*cos(x^4) - 432*x^3*sin(x^4) - (24*cos(x^4))/x + 256*x^11*sin(x^4);
end

kmax=floor((1+(3/10))/h); %máximo k inteiro tal que hk está em [0,1+(3/10)]
k=0:kmax;
aprox=(@(z) (2*f(z-4*h)-7*f(z+h)+5*f(z+3*h))/(35*h^2)); %expressão da alínea a)
z=k.*h;

f2vals=arrayfun(aprox,z); %valores de f''(z) obtidos com expressão da alínea a)

f2real_vals=arrayfun(d2f,z); %valores de f''(z) obtidos com função matlab (considerados 'reais')

erro_abs=abs(f2vals-f2real_vals); %diferença absoluta obtida entre os 2 métodos (erro 'real')

aux=@(x) (924/840)*(h^2)*max(abs(arrayfun(d4f,x-4*h:1/10000:x+3*h))); %calcula o valor do majorante do erro no intervalo discretizado de forma suficientemente fina
majorante_erro=arrayfun(aux,z); %valores do majorante do erro absoluto com a fórmula obtida em a) para cada z
end

%%função do enunciado: f= @(x) cos(3*x^2 + 5*x)
%%função do grupo: g =@(x) sen(x^4)/x