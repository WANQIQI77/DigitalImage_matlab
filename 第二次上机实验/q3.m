% 读入图像
img = imread('1.jpg');

% 转换为灰度图像
img = rgb2gray(img);

% 计算图像的傅里叶变换
f = fft2(double(img));

% 构建高斯低通滤波器
D0 = 20; % 设置截止频率
[M, N] = size(img);
[X, Y] = meshgrid(1:N, 1:M);
D = sqrt((X-M/2).^2 + (Y-N/2).^2);
Hlpf = exp(-(D.^2)./(2*(D0^2)));

% 构建高斯高通滤波器
D0 = 20; % 设置截止频率
[M, N] = size(img);
[X, Y] = meshgrid(1:N, 1:M);
D = sqrt((X-M/2).^2 + (Y-N/2).^2);
Hhpf = 1 - exp(-(D.^2)./(2*(D0^2)));

% 对图像进行频域滤波
Glpf = real(ifft2(f.*Hlpf));
Ghpf = real(ifft2(f.*Hhpf));

% 显示滤波效果
figure;
subplot(1,3,1);
imshow(img, []);
title('原始图像');
subplot(1,3,2);
imshow(Glpf, []);
title('高斯低通滤波效果');
subplot(1,3,3);
imshow(Ghpf, []);
title('高斯高通滤波效果');
