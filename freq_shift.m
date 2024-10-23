% We are going to use the signal from linearityproperty.m
% So I am going to declare them here
n= 0:(999);
sine_1 =  sin(2*pi*0.1*n);
sine_2 =  sin(2*pi*0.3*n);
w = linspace(-pi, pi, 256);
fr_res_total=freqz(3*sine_1 + 2*sine_2, 1, w);
sine_total = 3* sine_1 + 2*sine_2;

% In theory multiplying a signal with e^(j*Wo*n) causes Wo
% unit frequency shift to right

%declare the imaginary number
j = sqrt(-1);
fr_res_shifted = freqz(sine_total.*exp(j*0.2*pi*n),1,w);

figure (1);
subplot(3,1,1)
plot(w/pi, abs(fr_res_total)/512);
title('DTFT[3*sine(2*pi*0.1*n) + 2*sin(2*pi*0.3*n)]');
subplot(3,1,2)
plot(w/pi,abs(fr_res_shifted)/512);
title('DTFT[(3*sine(2*pi*0.1*n) + 2*sin(2*pi*0.3*n))*exp(j*0.2*pi*n)]');
n1 = 0:9999;
subplot(3,1,3)
sine_1_N =  sin(2*pi*0.1*n1);
sine_2_N =  sin(2*pi*0.3*n1);
fr_res_total_N=freqz((3*sine_1_N + 2*sine_2_N).*exp(j*0.2*pi*n1), 1, w);
plot(w,abs(fr_res_total_N)/512)
title('DTFT[(3*sine(2*pi*0.1*n) + 2*sin(2*pi*0.3*n))*exp(j*0.2*pi*n)] on 10000 Samples')

%There is a spectral leakage due to windowing effect. We can't create a
%real dirac delta in our computers. Creating a accurate dirac delta needs
%infinite samples but we have to crop the signal. In order to perform that
%we need to multiply our time domain signal with a rectangular pulse and 
%and rectangular pulse has the dtft as sinc function. As you can see as we
%increased the function's similarity to a dirac delta increased.
