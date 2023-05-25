% 读取图像
image = imread('i1.jpg');

% 添加高斯噪声
noisy_image1 = imnoise(image, 'gaussian');

% 添加盐和胡椒噪声
noisy_image2 = imnoise(image, 'salt & pepper');

% 添加乘性噪声
noisy_image3 = imnoise(image, 'speckle');

% 显示原始图像和添加噪声后的图像
subplot(2, 2, 1), imshow(image), title('原始图像');
subplot(2, 2, 2), imshow(noisy_image1), title('高斯噪声');
subplot(2, 2, 3), imshow(noisy_image2), title('盐和胡椒噪声');
subplot(2, 2, 4), imshow(noisy_image3), title('乘性噪声');
