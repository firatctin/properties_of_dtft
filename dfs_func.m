function xk = dfs_func(xn, N, K)
%dfs_func takes a x[n] periodic discrete-time signal as xn with a 
%period of N and K is the number of frequency bins and returns the DFS
%coefficients

%defining the imaginary number
j = sqrt(-1);
W = exp(-j*2*pi/N);
for k=0:K-1
    sum = 0;
    for n = 0:N-1
        sum = sum + xn(n+1)*W^(k*n);
    end
    xk(k+1) = sum;
end


end

