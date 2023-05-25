% 读取添加噪声后的图像
noisy_image1 = imread('noisy_image1.jpg');
noisy_image2 = imread('noisy_image2.jpg');
noisy_image3 = imread('noisy_image3.jpg');

% 设置去噪参数
psf = fspecial('gaussian', [5 5], 2);
lambda = 0.01;
iterations = 10;

% 使用deconvreg进行去噪复原
restored_image1 = deconvreg(noisy_image1, psf, lambda, iterations);

% 使用deconvwnr进行去噪复原
restored_image2 = deconvwnr(noisy_image2, psf, 0.01);

% 使用deconvblind进行去噪复原
restored_image3 = deconvblind(noisy_image3, psf, iterations);

% 显示去噪复原后的图像
subplot(2, 2, 1), imshow(noisy_image1), title('添加高斯噪声');
subplot(2, 2, 2), imshow(restored_image1), title('deconvreg复原');
subplot(2, 2, 3), imshow(noisy_image2), title('添加盐和胡椒噪声');
subplot(2, 2, 4), imshow(restored_image2), title('deconvwnr复原');
figure,
subplot(1, 2, 1), imshow(noisy_image3), title('添加乘性噪声');
subplot(1, 2, 2), imshow(restored_image3), title('deconvblind复原');
