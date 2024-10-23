%In this file we are aiming to observe the convolution property of the DTFT
%We are expecting convolution in time domain convert into multiplication in
%frequency domain

%Let's start with defining the discrete time signals we are going to use

g=[1 3 -5 6 9 13 -14 15 2];
h=[-1 2 3 -2 -1];
%Firstly we perform the calculation of the frequency responses of these
%signals

w = linspace(-pi,pi,256);

freq_g = freqz(g,1,w);
freq_h = freqz(h,1,w);

%secondly we are going to obtain convolution result

convolution = conv(g,h);
%Let's calculate the frequency response of this convolution

%DTFT(g * h)
fr_res_conv = freqz(convolution,1,w);
%DTFT(g)*DTFT(h)
fr_res_mul = freq_g .* freq_h;
% Then we are going to plot these signals. Our expectation is the both
% plots will be the same.

figure (1)
subplot(2,1,1)
plot(w/pi, abs(fr_res_conv))
title('DTFT(conv(g[n],h[n]))');

subplot(2,1,2)
plot(w/pi, abs(fr_res_mul))
title('DTFT(g[n])*DTFT(h[n])');
