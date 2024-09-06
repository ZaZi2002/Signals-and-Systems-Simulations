clc
clear
fs = 9;
Ts = 1/fs;
t = -10:Ts:4;
w = linspace(-pi,pi,1025);
x = (1.5 + 0.3*sin(2*pi*t) + sin(2*pi*t/3) - sin(0.2*pi*t)).*(sin(pi*t))./(pi*t); 
% الف
subplot(2,1,1);
stem(x);
title('fs = 9Hz');
grid on
fft(x)
X = fft(x);
subplot(2,1,2);
plot(X);
title('X(W)');
grid on
