function [output] = method4(im)
%METHOD4 Method 4 from the paper
%   Take YCbCr image, binarize based on Cr and Cb images

    output = im(:,:,3) > im(:,:,2);

end


