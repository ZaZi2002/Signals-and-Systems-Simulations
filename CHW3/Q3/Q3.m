clear
clc
syms z
% الف
F = (z^4 + 0.99) / ((z^4 - 0.99)*(z - 0.5)); 
% ب
[N,D] = numden(F); 
N1 = sym2poly(N);
D1 = sym2poly(D);
F1 = tf(N1,D1); 
% پ
pzmap(F1);
grid on
% ت
r_axis = -1:0.01:1;
i_axis = -1:0.01:1;
[R,I] = meshgrid(r_axis,i_axis);
F2 =@(z) (z.^4 + 0.99) / ((z.^4 - 0.99).*(z - 0.5));
figure(2);
plot3(R,I,abs(F2(R+1i.*I)));
xlabel('Re')
ylabel('Im')
grid on
% ث
f = iztrans(F);
f