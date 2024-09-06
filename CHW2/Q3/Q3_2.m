clear
clc
[X1,cmap1] = imread('face1.png');
%imshow(X1,cmap1);
[X2,cmap2] = imread('face2.png');
%imshow(X2,cmap2);
X = imgaussfilt(X1,10);
Y =X2 - imgaussfilt(X2,20);
Z = X + Y;
hold on
subplot(1,2,1)
imshow(X,cmap1);
title('image1')
subplot(1,2,2)
imshow(Y,cmap2);
title('image2')
figure(2)
imshow(Z,cmap1);
title('image3')