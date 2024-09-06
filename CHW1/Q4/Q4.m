clear
clc
n = -10:1:10;
x =@(n) n.*heaviside(n) - 2*(n-1).*heaviside(n-1) + (n-2).*heaviside(n-2); %x[n]
hold on
subplot(2,1,1);
stem(n,x(n),'b');%plot of x[n]
title('x[n]')
grid on

subplot(2,1,2);
N=20;
y=0;
for k=1:N
    u=-(N/2)-1 + k; %negetive k's
    y = y + x(n-2*u);% y[n] = Sigma of x[n-2k]
end
stem(n,y);%plot of y[n]
title('y[n]')
grid on