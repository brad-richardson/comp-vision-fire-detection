% Brad Richardson
% Final Project
% Fire detection in image

close all;
clear variables;

im = imread('./image/fig9a.jpg');

tauValues = [1, 40, 60, 80, 90, 95, 100];
for i = 1:size(tauValues, 2)
    tau = tauValues(i);
    [fireDetected, fireOnlyIm, ~] = FireDetection(im, tau);
    fireColoredIm = MatchColorChange(im, fireDetected, 0, 0, 255);
    imwrite(fireOnlyIm, sprintf('./out/fire-only-%dtau.png', tau));
    imwrite(fireColoredIm, sprintf('./out/fire-colored-%dtau.png', tau));
end

% Display only default tau value results
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

subplot(3,3,9);
imshow(fireColoredIm);

%YCbCrFigure(im);
