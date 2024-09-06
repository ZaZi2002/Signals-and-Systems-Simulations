clear
clc
t = linspace(-2,2,1000); %t range in a periode
x=@(t) t.*(heaviside(t)-heaviside(t-1)); %x(t)
y=@(t) (-t).*(heaviside(-t)-heaviside(-t-1)); %x(-t)
z=@(t) x(t) + y(t); %x(t)+x(-t)
hold on
subplot(3,2,1);
plot(t,x(t),'r'); %plot x(t)
title('x(t)')
grid on
subplot(3,2,3);
plot(t,y(t),'b'); %plot y(t)=x(-t)
title('y(t)')
grid on
subplot(3,2,5);
plot(t,z(t),'g'); %plot z(t)=x(t)+x(-t)
title('z(t)')
grid on

%fourier coefficients
N=50; %number of terms
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    w=@(t) x(t).*exp(-1i*k*pi*t);
    xk(u) = (1/2)*integral(w,-1,1); %xk coefficients
    w=@(t) y(t).*exp(-1i*k*pi*t);
    yk(u) = (1/2)*integral(w,-1,1); %yk coefficients
    w=@(t) (x(t)+y(t)).*exp(-1i*k*pi*t);
    zk(u) = (1/2)*integral(w,-1,1); %zk coefficients
end
x_f = 0;
y_f = 0;
z_f = 0;
%fourier series
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    x_f = x_f + xk(u)*(exp(1i*k*t*pi)); %x(t) fourier series
    y_f = y_f + yk(u)*(exp(1i*k*t*pi)); %y(t) fourier series
    z_f = z_f + zk(u)*(exp(1i*k*t*pi)); %x(t)+x(-t) fourier series
end
subplot(3,2,2);
plot(t,x_f,'r'); %plot x(t) fourier series
title('xf(t)')
grid on
subplot(3,2,4);
plot(t,y_f,'b'); %plot x(-t) fourier series
title('yf(t)')
grid on
subplot(3,2,6);
plot(t,z_f,'g'); %plot x(t)+x(-t) fourier series
title('zf(t)')
grid on

%coefficients plots
figure(2)
u =1:1:N;
subplot(3,1,1);
plot(u-(N/2),xk,'r'); %plot xk's
title('xk')
grid on
subplot(3,1,2);
plot(u-(N/2),yk,'b'); %plot yk's
title('yk')
grid on
subplot(3,1,3);
plot(u-(N/2),zk,'g'); %plot zk's
title('zk')
grid on