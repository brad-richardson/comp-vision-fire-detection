function [output] = method3(im)
%METHOD3 Method 3 from the paper
%   Take YCbCr image, binarize based on Y and Cb values

    output = im(:,:,1) > im(:,:,2);

end

