function [output] = MatchColorChange(im, pixels, red, green, blue)
%MatchColorChange Change matching pixels in image
%   Change all pixels marked with 1 in 'pixels' to RGB values specified

    [row, col, ~] = size(im);
    output = im;
    for i = 1:row
        for j = 1:col
            if pixels(i,j) == 1
                output(i,j,1) = red;
                output(i,j,2) = green;
                output(i,j,3) = blue;
            end
        end
    end

end

