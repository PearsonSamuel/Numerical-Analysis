
function[v] = Ex2a(N,E)
v=zeros(N,1); 
f=zeros(N,1); 
for k=0:N-1 %criar vetor com valores ~f0, ..., ~fN-1
    xk=2*pi*k/N; 
    f(k+1)=(cos(8*xk)/18)*sum((1:36)*xk - floor((1:36)*xk));
end
for k = 0:N-1 %calcular a entrada de índice k da convolução
    z=transpose(k-E:k+E); %índices j intervenientes no somatório
    z=mod(z,N);
    v(k+1) = (1/(2*E +1))*sum(f(z+1));
end
end