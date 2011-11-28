function [correlation] = histcompare(img1,img2)
% Kalev Roomann-Kurrik
% Digital Signal Processing Design 
% Fall 2010 - Rabiner

% compares the 2D histograms of two images
% generated from the function 'gridhist' that 
% I wrote, and returns a correlation value for
% them based on differences in corresponding bins
% of the histograms.
% The lower the correlation the more likely the images
% are of the same thing.

% produce the 2D histograms of the two input images
% using the 'gridhist' function
image_1_hist = gridhist(img1);
image_2_hist = gridhist(img2);

% figure(3);subplot(211);imshow(image_1_hist);
% figure(3);subplot(212);imshow(image_2_hist);

% The correlation value is the sum of the absolute value
% of the differences between values in corresponding bins for the
% two images
correlation_map=0;
correlation=0;

for i=1:8
    for j=1:8
        correlation_map = correlation_map + abs(image_1_hist(i,j)-image_2_hist(i,j));
    end
end

% Divide by size of grid (8x8)
correlation = correlation_map / 64;

