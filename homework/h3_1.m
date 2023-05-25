% 读取图像
img = imread('i1.jpg');
% 转换为灰度图像
img = rgb2gray(img);
% 显示原始图像
imshow(img);
title('Original Image');

% 构造Roberts梯度算子
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];

% 对图像进行卷积运算
gx = conv2(double(img), roberts_x, 'same');
gy = conv2(double(img), roberts_y, 'same');

% 计算梯度幅值
grad = sqrt(gx.^2 + gy.^2);

% 对梯度幅值进行归一化处理
grad_norm = uint8(255 * mat2gray(grad));

% 显示Roberts滤波结果
figure, imshow(grad_norm);
title('Roberts Filtered Image');
