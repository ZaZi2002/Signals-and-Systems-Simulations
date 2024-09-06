clear
clc
w = linspace(-pi,pi,1000); %w range in a periode
mag_r =@(w) sin(5.5*w)./(sin(0.5*w));
ph_r =@(w) atan(cot(5.5*w))./atan(cot(0.5*w));
hold on
subplot(2,1,1);
plot(w,mag_r(w),'r');
title('|R(jw)|');
grid on
subplot(2,1,2);
plot(w,ph_r(w),'b');
title('<R(jw)');
grid on
%%
n = -10:1:20;
x =@(n) (n>=0) - (n>=11);
y =@(n) fft(x(n));
y =@(n) fftshift(y(n));
figure(2);
hold on
subplot(3,1,1);
stem(n,x(n),'r');
title('r[n]');
grid on
subplot(3,1,2);
plot(n,abs(y(n)),'b');
title('|R(e^j^w)|');
grid on
subplot(3,1,3);
plot(n,angle(y(n)),'b');
title('<R(e^j^w)');
grid on
%%
m = -15:1:15;
x2 =@(m) (m>=-5) - (m>=6);
y2 =@(m) fft(x2(m));
y2 =@(m) fftshift(y2(m));
figure(3);
hold on
subplot(3,1,1);
stem(m,x2(m),'r');
title('r[n+5]');
grid on
subplot(3,1,2);
plot(m,abs(y2(m)),'b');
title('|R(e^j^w)|');
grid on
subplot(3,1,3);
plot(m,angle(y2(m)),'b');
title('<R(e^j^w)');
grid on