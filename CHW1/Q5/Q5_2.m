clear
clc
n = 1:1:28;
x =@(n) cos(2*pi*n/7); %x[n]
hold on
subplot(2,1,1);
stem(n,x(n),'b'); %plot of x[n]
title('x[n]')
grid on

N=28;
for k=1:N
    y(k) = 0;
    if (mod(k,2)==0)
        y(k) = cos(pi*k/7);
    end
end
subplot(2,1,2);
stem(n,y,'r'); %plot of y[n]
title('y[n]')
grid on