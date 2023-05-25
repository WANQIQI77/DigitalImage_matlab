% 读取图像
img = imread('i1.jpg');

% 将图像转换为灰度
if size(img, 3) == 3
    img = rgb2gray(img);
end

% 初始化输出图像
filtered_img = zeros(size(img));

% 定义3x3的平均滤波器
filter = ones(3, 3) / 9;

% 对每个像素进行滤波
for i = 2:size(img, 1)-1
    for j = 2:size(img, 2)-1
        % 取出3x3的像素矩阵
        img_patch = img(i-1:i+1, j-1:j+1);
        
        % 对像素矩阵进行滤波
        filtered_pixel = sum(sum(double(img_patch) .* filter));
        
        % 将滤波后的像素值存储到输出图像中
        filtered_img(i,j) = filtered_pixel;
    end
end

% 显示滤波前后的图像
figure;
subplot(1,2,1);
imshow(img);
title('原图像');
subplot(1,2,2);
imshow(uint8(filtered_img));
title('滤波后的图像');
