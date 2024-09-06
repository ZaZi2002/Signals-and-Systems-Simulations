clear
clc
[I,cmap1] = imread('image.jpg'); % آ
imshow(I,cmap1); % ب
I_double = im2double(I); % پ
imshow(2*I_double,cmap1); % ت
title("2*(I_double)");
% ث
I_double_nored = I_double;
I_double_nored(:,:,1) = 0; 
I_double_nogreen = I_double;
I_double_nogreen(:,:,2) = 0;
I_double_noblue = I_double;
I_double_noblue(:,:,3) = 0;
figure(2);
hold on
subplot(1,3,1);
imshow(I_double_nored,cmap1);
title('no red');
subplot(1,3,2);
imshow(I_double_nogreen,cmap1);
title('no green');
subplot(1,3,3);
imshow(I_double_noblue,cmap1);
title('no blue');
% ج
figure(3);
imhist(I);
% چ
figure(4);
gray_I_double = rgb2gray(I_double);
imshow(gray_I_double);
title('gray');
% ح
figure(5);
hsv_I_double = rgb2hsv(I_double);
imshow(hsv_I_double);
title('hsv');
% خ
myLowpassFilter = ones(10)/100;
filtered_I_double = conv2(gray_I_double,myLowpassFilter);
figure(6);
imshow(filtered_I_double);
title('low pass filter');
% د
laplacianFilter = [0 -1 0; -1 4 -1; 0 -1 0];
laplace_I_double = conv2(gray_I_double,laplacianFilter);
figure(7);
imshow(laplace_I_double);
title('laplacian filter');
