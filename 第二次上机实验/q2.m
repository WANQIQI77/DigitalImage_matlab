% 读入图像
img = imread('2.jpg');

% 转换为灰度图像
img = rgb2gray(img);

% 计算图像的傅里叶变换
f = fft2(double(img));

% 创建Sobel滤波模板
hx = [-1,-2,-1; 0,0,0; 1,2,1];
hy = hx';

% 将Sobel滤波模板转换为频域中的卷积核
Hx = fft2(hx, size(img, 1), size(img, 2));
Hy = fft2(hy, size(img, 1), size(img, 2));

% 对图像进行频域卷积
Gx = real(ifft2(f.*Hx));
Gy = real(ifft2(f.*Hy));

% 计算Sobel滤波响应
G = sqrt(Gx.^2 + Gy.^2);

% 显示滤波效果
imshow(G, []);
title('2.jpg的Sobel滤波效果');
