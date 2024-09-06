clear
clc
[X1,cmap1] = imread('image1.jpg');
%imshow(X1,cmap1);
[X2,cmap2] = imread('image2.jpg');
X1(:,:,1);
%imshow(X2,cmap2);
Ft_X1 = fft2(X1);
Ft_X2 = fft2(X2);
mag_X1 = abs(Ft_X1);
mag_X2 = abs(Ft_X2);
ph_X1 = angle(Ft_X1);
ph_X2 = angle(Ft_X2);

newFt_X1 = mag_X1.*exp(1i*ph_X2);
new_X1 = ifft2(newFt_X1);
newFt_X2 = mag_X2.*exp(1i*ph_X1);
new_X2 = ifft2(newFt_X2);


hold on
subplot(1,2,1)
imshow(new_X1,cmap1);
title('image1')
subplot(1,2,2)
imshow(new_X2,cmap2);
title('image2')


