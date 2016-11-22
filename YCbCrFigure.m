function [] = YCbCrFigure(rgbIm)
%YCBCRCHANNELSFIGURE Show original image and values for YCbCr channels in
%figure
%   Input is an rgb image matrix
    
    ycbcr = rgb2ycbcr(rgbIm);
    figure;
    subplot(2,2,1);
    imshow(rgbIm);

    subplot(2,2,2);
    imshow(ycbcr(:,:,1));

    subplot(2,2,3);
    imshow(ycbcr(:,:,2));

    subplot(2,2,4);
    imshow(ycbcr(:,:,3));

end

