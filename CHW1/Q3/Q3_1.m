clear
clc
syms t;
t = linspace(-0.51,0.51,1000); %t range in a periode
x =@(t) 2.*(heaviside(t+0.25)-heaviside(t-0.25))-1;
hold on
subplot(2,1,1);
plot(t,x(t)); %plot x(t)
title('X(t)');
grid on

%fourier coefficients
N=400; %number of terms
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    w=@(t) x(t).*exp(-1i*k*2*pi*t);
    xk(u) = integral(w,-0.5,0.5); %xk coefficients
end
x_f = 0;
%fourier series
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    x_f = x_f + xk(u)*(exp(1i*k*t*2*pi)); %x(t) fourier series
end
subplot(2,1,2);
plot(t,x_f,'r'); %plot x(t) fourier series
title('Xf(t)');
grid on

