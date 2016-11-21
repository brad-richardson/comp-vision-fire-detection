function [output] = method6(im)
%METHOD6 Method 6 from the paper
%   Take YCbCr image, binarize based on Cb-Cr difference

    tauValue = 40;
    diff = abs(im(:,:,2) - im(:,:,3));
    output = diff >= tauValue;
    %output = ones(size(output));
    disp('FIX METHOD 6');

end

