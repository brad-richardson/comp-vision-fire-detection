function [output] = method8(im)
%METHOD8 Method 8 from the paper
%   Take YCbCr image, binarize based on polynomials used to estimate
%   red-diff chroma component for fire and comparing to the Cb channel

    cb = double(im(:,:,2));
    crVals = double(im(:,:,3));
    cr = {crVals, crVals.^2, crVals.^3, crVals.^4, crVals.^5, crVals.^6, crVals.^7};
    
    % Individual functions of Cr
    fuCr = -(2.6*power(10,-10)).*cr{7} + (3.3*power(10,-7)).*cr{6} - ...
        (1.7*power(10,-4)).*cr{5} + (5.16*power(10,-2)).*cr{4} - ...
        (9.10.*cr{3}) + (9.60*100).*cr{2} - (5.6*power(10,4)).*cr{1} + ...
        (1.4*power(10,6));
    flCr = -(6.77*power(10,-8)).*cr{5} + (5.5*power(10,-5)).*cr{4} - ...
        (1.76*power(10,-2)).*cr{3} + (2.78.*cr{2}) -  ...
        (2.15*power(10,2)).*cr{1} + (6.62*power(10,3));
    fdCr = (1.81*power(10,-4)).*cr{4} - (1.02*power(10,-1)).*cr{3} + ...
        (2.17*10).*cr{2} - (2.05*power(10,3)).*cr{1} + (7.29*power(10,4));
    
    fuCrPart = cb >= fuCr;
    fdCrPart = cb <= fdCr;
    flCrPart = cb <= flCr;

%     fuCrPart2 = cb-fuCr;
%     fdCrPart2 = cb-fdCr;
%     flCrPart2 = cb-flCr;
%     figure;
%     imshow(fuCrPart2, []);
%     figure;
%     imshow(fdCrPart2, []);
%     figure;
%     imshow(flCrPart2, []);
    
    output = fuCrPart & fdCrPart & flCrPart;

end

