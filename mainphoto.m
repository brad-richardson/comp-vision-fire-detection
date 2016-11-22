% Brad Richardson
% Final Project
% Fire detection in image

close all;
clear variables;

im = imread('./data/fig9a.jpg');

[fireDetected, fireOnlyIm, methodResults] = FireDetection(im);

figure;
subplot(3,3,1);
imshow(im);

subplot(3,3,2);
imshow(methodResults{1});

subplot(3,3,3);
imshow(methodResults{2});

subplot(3,3,4);
imshow(methodResults{3});

subplot(3,3,5);
imshow(methodResults{4});

subplot(3,3,6);
imshow(methodResults{5});

subplot(3,3,7);
imshow(fireDetected);

subplot(3,3,8);
imshow(fireOnlyIm);

%YCbCrFigure(im);
