clear
clc
t = linspace(-10,10,10000); %t range in a periode
T0 = 1/880;
T = 5*T0;
w=@(t) t.*heaviside(t) - (t-T/4).*(heaviside(t-T/4)) -(t-3*T/4).*(heaviside(t-3*T/4)) + (t-T).*heaviside(t-T); %w(t)
hold on
subplot(3,1,1);
plot(t,w(t),'r'); %plot w(t)
title('w(t)')
grid on

x=@(t) cos(2*pi*t*880);
s=@(t) x(t).*w(t);

%fourier coefficients
N=10000; %number of terms
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    y=@(t) w(t).*exp(-1i*k*pi*1760*t);
    wk(u) = (1/2)*integral(y,-1/1760,1/1760); %wk coefficients
    i=@(t) s(t).*exp(-1i*k*pi*t*1760);
    sk(u) = (1/2)*integral(i,-1/1760,1/1760); %sk coefficients
end
w_f = 0;
s_f = 0;
%fourier series
for u=1:N
    k=u-(N/2); %biass for calculating negative k's
    w_f = w_f + wk(u)*(exp(1i*k*t*pi*1760)); %w(t) fourier series
    s_f = s_f + sk(u)*(exp(1i*k*t*pi*1760)); %s(t) fourier series
end
subplot(3,1,2);
plot(t,w_f,'r'); %plot w(t) fourier series
title('wf(t)')
grid on
subplot(3,1,3);
plot(t,x(t),'g'); %plot x(t) fourier series
title('x(t)')
grid on

figure(2)
subplot(2,1,1);
plot(t,s(t),'b'); %plot s(t)
title('s(t)')
grid on
subplot(2,1,2);
plot(t,s_f,'b'); %plot s(t) fourier series
title('sf(t)')
grid on

figure(3)
u =1:1:N;
plot(u,sk,'r'); %plot sk fourier coefficients
title('sk')
grid on
audiowrite("Q3_x(t).wav",x(t),1720)
audiowrite("Q3_s(t).wav",real(s_f),1760)
