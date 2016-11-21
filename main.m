% Brad Richardson
% Final Project

close all;
clear variables;

fig9a = imread('./data/fig9a.png');
[fireDetected, fireOnlyIm, methodResults] = FireDetection(fig9a);

figure;
subplot(3,3,1);
imshow(fig9a);

subplot(3,3,2);
imshow(methodResults{1});

subplot(3,3,3);
imshow(methodResults{2});

subplot(3,3,4);
imshow(methodResults{3});

subplot(3,3,5);
imshow(methodResults{4});

subplot(3,3,7);
imshow(fireDetected);

subplot(3,3,8);
imshow(fireOnlyIm);

