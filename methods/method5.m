function [output] = method5(im)
%METHOD5 Method 5 from the paper
%   Take YCbCr image, binarize based on YCbCr channel means and values

    y = im(:,:,1);
    cb = im(:,:,2);
    cr = im(:,:,3);
    yMean = mean(y(:));
    cbMean = mean(cb(:));
    crMean = mean(cr(:));
    output = y > yMean & cb < cbMean & cr > crMean;

end

