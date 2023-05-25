% 读入图像
img = imread('1.jpg');

% 转换为灰度图像
img = rgb2gray(img);

% 计算图像的傅里叶变换
f = fft2(double(img));

% 计算频谱图和相位图
Fmag = abs(f);
Fphase = angle(f);

figure(1);
% 显示频谱图
subplot(2,2,1);
imshow(log(1+Fmag),[]);
title('频谱图');

% 显示相位图
subplot(2,2,2);
imshow(Fphase,[]);
title('相位图');

% 将频谱图进行旋转
Fmag_rotated = imrotate(Fmag, 45, 'crop');

% 显示旋转后的频谱图
subplot(2,2,3);
imshow(log(1+Fmag_rotated),[]);
title('旋转后的频谱图');

% 对旋转后的频谱图进行傅里叶反变换
f_rotated = ifft2(Fmag_rotated.*exp(1i*Fphase));

% 显示反变换后的图像
subplot(2,2,4);
imshow(abs(f_rotated),[]);
title('反变换后的图像');
