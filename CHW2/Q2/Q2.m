clear y Fs 
clc
[y,Fs] = audioread('audio.wav');
%sound(y,Fs);
x = fft(y);
hold on
subplot(2,1,1)
plot(y);
title('main sound');
grid on
subplot(2,1,2)
stem(x,'g');
title('F transform');
grid on
%%
y_1 = 2.*downsample(y,2);
%sound(y_1,Fs);
%audiowrite('downsampled_audio.wav',y_1,Fs);
figure(2)
x_1 = fft(y_1);
hold on
subplot(2,1,1)
plot(y_1);
title('downsampled sound');
grid on
subplot(2,1,2)
stem(x_1,'g');
title('F transform');
grid on
%%
y_2 = upsample(y_1,2);
%sound(y_2,Fs);
%audiowrite('upsampled_audio.wav',y_2,Fs);
figure(3)
x_2 = fft(y_2);
hold on
subplot(2,1,1)
plot(y_2);
title('upsampled sound');
grid on
subplot(2,1,2)
stem(x_2,'g');
title('F transform');
grid on
t=1;
E=0;
e = abs(y_2 - y);
while (t<=Fs)
    E = E + e(t);
    t = t + 1;
end
E
%%
[b,a]=butter(1,3000/(Fs/2));
y_3 = filtfilt(b,a,y_2);
sound(y_3,Fs);
audiowrite('filtered_audio.wav',y_3,Fs);
figure(4)
x_3 = fft(y_3);
hold on
subplot(2,1,1)
plot(y_3);
title('filtered sound');
grid on
subplot(2,1,2)
stem(x_3,'g');
title('F transform');
grid on