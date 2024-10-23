%We are going to inspect the properties of the DTFT
%first property we are going to start with is linearity

%Linear operations must satisfy the superposition principle
%The superposition we are looking for:
%DTFT{ax[n]+by[n]} = a*DTFT{x[n]} + b * DTFT{y[n]}


% Start with creating 2 sinusoidal signals.
% x[n] = sin(2*pi*0.1*n) & y[n] = sin(2*pi*0.3*n)
% our weight coefficients are a = 3, b = 2

n= 0:(999); %1000 samples 


sine_1 =  sin(2*pi*0.1*n);%to make it simple I multiplied our signal with 3 already. Because of a = 3
sine_2 =  sin(2*pi*0.3*n);

%let's plot these signals.

%to obtain a more meaningful signal we can use another sample n
n_to_show = linspace(0,10,1000);%we know that sine_1 has the freq of 0.1 so its period is 10 and sine_2 has the period of 3 times than sine_1
sine_1_s =  sin(2*pi*0.1*n_to_show);
sine_2_s =  sin(2*pi*0.3*n_to_show);
%we are not going to use these variables while performing calculations
%they are only exist for plotting the graphs.


figure (1);
subplot(2,1,1)
plot(n_to_show,sine_1_s)
title('sin(2*pi*0.1*n)');


subplot(2,1,2)
plot(n_to_show,sine_2_s);
title('sin(2*pi*0.3*n)');

%now lets apply the superposition. We are going to use freqz command to
%find the frequency responses
w = linspace(-pi, pi, 256);
%3 * DTFT{sin(2*pi*0.1*n)} + 2 * DTFT{sin(2*pi*0.3*n)}
fr_res_1 = freqz(sine_1, 1, w);
fr_res_2 = freqz(sine_2, 1, w);
fr_res_1_2 = 3*fr_res_1 + 2*fr_res_2;
%DTFT{3*sin(2*pi*0.1*n) + 2*sin(2*pi*0.3*n)}
fr_res_total=freqz(3*sine_1 + 2*sine_2, 1, w);

%let's plot them
figure (2);
subplot(2,1,1)
plot(w/pi, abs(fr_res_1_2)/512)
title('3 * DTFT[sin(2*pi*0.1*n)] + 2 * DTFT[sin(2*pi*0.3*n)]');

subplot(2,1,2)
plot(w/pi, abs(fr_res_total)/512)
title('DTFT[3*sin(2*pi*0.1*n) + 2*sin(2*pi*0.3*n)]');



