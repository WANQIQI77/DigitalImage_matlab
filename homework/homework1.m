I=imread('i1.jpg');
figure(1)
subplot(2,2,1)
title('原图');imshow(I);

I1=0.299*I(:,:,1)+0.587*I(:,:,2)+0.1148*I(:,:,3);
subplot(2,2,2)
title('灰度图');imshow(I1);

k=1.2;
b=0;
I2=k.*I+b;
subplot(2,2,3);
title('增强对比度');imshow(I2);

I=im2double(I);
I2=im2double(I);
I3=imadd(I,I2);

subplot(2,2,4);
title('叠加');imshow(I2);