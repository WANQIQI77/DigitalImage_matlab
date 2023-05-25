% 读取图像并转换为灰度图像
img = imread('i1.jpg');
grayImg = rgb2gray(img);

% 定义拉普拉斯滤波器
laplacianFilter = [0 -1 0; -1 4 -1; 0 -1 0];

% 将图像与滤波器卷积
enhancedImg = imfilter(grayImg, laplacianFilter);

% 将增强后的图像与原始图像相加
finalImg = grayImg + enhancedImg;

% 显示结果
imshow(finalImg);
