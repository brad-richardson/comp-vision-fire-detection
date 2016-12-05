function [fireDetected, fireOnlyIm, methodResults] = FireDetection(rgbIm, tau)
%FIREDETECTION Detect fire in an image
%   Take an input RGB image and return:
%   1. A binarized matrix with the locations where fire was detected after
%   combination of methods
%   2. Cell array with results of individual methods

    if nargin == 1
        tau = 40;
    end

    im = rgb2ycbcr(rgbIm);
    
    addpath('./methods');
    method3Result = method3(im);
    method4Result = method4(im);
    method5Result = method5(im);
    method6Result = method6(im, tau);
    
    % TODO - fix this
    method8Result = method8(im);
    method8Result = ones(size(method8Result), 'logical');
    
    methodResults = {method3Result, method4Result, method5Result, ...
        method6Result, method8Result};
    
    [row, col, ~] = size(rgbIm);
    fireDetected = ones(row, col, 'logical');
    for i = 1:length(methodResults)
        currResult = methodResults{i};
        fireDetected = fireDetected & currResult;
    end
    
    fireOnlyIm = rgbIm;
    for i = 1:row
        for j = 1:col
            if fireDetected(i,j) == 0
                fireOnlyIm(i,j,:) = 0;
            end
        end
    end
    
end

