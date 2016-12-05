function [output] = method6(im, tau)
%METHOD6 Method 6 from the paper
%   Take YCbCr image, binarize based on Cb-Cr difference
%   Tau is a constant used to threshold difference, can be set from:
%   1(most true positive) - 100 (least false positive)
%   tau of 40 is the default which gives 90% true/40% false and is recommended from paper

    diff = abs(double(im(:,:,2)) - double(im(:,:,3)));
    output = diff >= tau;

end

