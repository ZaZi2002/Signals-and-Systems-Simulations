clear
clc
n = -14:1:14;
x =@(n) cos(2*pi*n/7); %x[n]
hold on
subplot(2,1,1);
stem(n,x(n),'b'); %plot of x[n]
title('x[n]')
grid on

z =@(n) x(2*n); %z[n] = x[2n]
subplot(2,1,2);
stem(n,z(n),'r'); %plot of z[n]
title('z[n]')
grid on