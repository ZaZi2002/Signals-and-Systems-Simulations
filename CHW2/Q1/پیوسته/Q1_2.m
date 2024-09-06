clear
clc
fs = 10;
t = linspace(-fs/2,fs/2,1000);
n = -100:1:100;
w = linspace(-fs/2,fs/2,1000);

x =@(t) heaviside(t+2) - heaviside(t-2);
hold on
subplot(2,2,1)
plot(t,x(t),'r');
title('x(t)');
grid on

y =@(n) x(n/fs);
Y = fft(y(n));
Y = fftshift(Y);
X = fs.*Y;
hold on
subplot(2,2,2)
plot(n,y(n),'b');
title('x[n]');
grid on
subplot(2,2,4)
plot(n,Y,'b');
title('X(e^j^w)');
grid on
subplot(2,2,3)
plot(n,X,'r');
title('X(jw)');
grid on