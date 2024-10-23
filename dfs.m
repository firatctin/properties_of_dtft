%In this code block we are going to perform DFS(Discrete Fourier Series)

%We are going to write our own function to perform it. We will perform it in dfs_func.m

%Let's define a periodic signal x[n] = [...2 1 3 2 1 3 2 1 3...]

%We will perform the DFS operation for K = 3 and K = 10 values
%K here is the DFT bins

%define our signal
xn = []
counter = 1;
for i=1:100
    if counter == 1
        xn(i) = 2;
        counter = counter +1;
        continue;
    elseif counter == 2
        xn(i) = 1;
        counter = counter +1;
        continue;
    elseif counter == 3
        xn(i) = 3;
        counter = 1;
        continue;
    end
end

%for K = 3

DFS_3 = dfs_func(xn, 3, 3);

%For K = 10
DFS_10 = dfs_func(xn, 3, 10);

%Let's visualize them

figure (1)
subplot(2,1,1)
stem(abs(DFS_3))
title('DFS Coefficients for K = 3');
subplot(2,1,2)
stem(abs(DFS_10))
title('DFS Coefficients for K = 10');




