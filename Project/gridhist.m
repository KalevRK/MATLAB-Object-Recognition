function [bins] = gridhist(orig_image)
% Kalev Roomann-Kurrik
% Digital Signal Processing Design 
% Fall 2010 - Rabiner

% creates a 2D histogram from an image
% with hue as the x-axis and saturation as the y-axis
% currently set to 8 bins by 8 bins

% get hsv version of image
image_hsv = rgb2hsv(orig_image);

% plot both images
% figure(1); subplot(211); imshow(orig_image);
% figure(1); subplot(212); imshow(image_hsv);

% bin divisions
% 0 = 0<=x<0.125
% 1 = 0.125<=x<0.25
% 2 = 0.25<=x<0.375
% 3 = 0.375<=x<0.5
% 4 = 0.5<=x<0.625
% 5 = 0.625<=x<0.75
% 6 = 0.75<=x<0.875
% 7 = 0.875<=x<1

% Separate HSV image into its H, S, and V components
% though only concerned about Hue and Saturation

% Hue component
H_comp = image_hsv(:,:,1);

% Saturation component
S_comp = image_hsv(:,:,2);

% Value component
V_comp = image_hsv(:,:,3);

% figure(2); subplot(311); imshow(H_comp);
% figure(2); subplot(312); imshow(S_comp);
% figure(2); subplot(313); imshow(V_comp);

% total number of pixels
img_size = size(image_hsv);
number_pixels = img_size(1,1)*img_size(1,2);

% counter for which element we are on
element_number = 1;

% array for bins
bins = zeros(8,8);

% go through every pixel in the Hue and Saturation components of the image
% if the pixel fits a condition increment the value in that bin
while(element_number<=number_pixels)
    
    % Bin (8,1)
    if(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,1) = bins(8,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,2) = bins(8,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,3) = bins(8,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,4) = bins(8,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,5) = bins(8,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,6) = bins(8,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,7) = bins(8,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0<=S_comp(element_number) && S_comp(element_number)<0.1250)
        bins(8,8) = bins(8,8) + 1;
        
    % Bin (7,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,1) = bins(7,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,2) = bins(7,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,3) = bins(7,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,4) = bins(7,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,5) = bins(7,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,6) = bins(7,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,7) = bins(7,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.1250<=S_comp(element_number) && S_comp(element_number)<0.2500)
        bins(7,8) = bins(7,8) + 1;
        
    % Bin (6,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,1) = bins(6,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,2) = bins(6,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,3) = bins(6,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,4) = bins(6,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,5) = bins(6,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,6) = bins(6,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,7) = bins(6,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.2500<=S_comp(element_number) && S_comp(element_number)<0.3750)
        bins(6,8) = bins(6,8) + 1;
        
    % Bin (5,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,1) = bins(5,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,2) = bins(5,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,3) = bins(5,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,4) = bins(5,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,5) = bins(5,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,6) = bins(5,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,7) = bins(5,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.3750<=S_comp(element_number) && S_comp(element_number)<0.5000)
        bins(5,8) = bins(5,8) + 1;
        
    % Bin (4,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,1) = bins(4,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,2) = bins(4,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,3) = bins(4,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,4) = bins(4,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,5) = bins(4,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,6) = bins(4,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,7) = bins(4,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.5000<=S_comp(element_number) && S_comp(element_number)<0.6250)
        bins(4,8) = bins(4,8) + 1;
        
    % Bin (3,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,1) = bins(3,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,2) = bins(3,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,3) = bins(3,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,4) = bins(3,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,5) = bins(3,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,6) = bins(3,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,7) = bins(3,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.6250<=S_comp(element_number) && S_comp(element_number)<0.7500)
        bins(3,8) = bins(3,8) + 1;
        
    % Bin (2,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,1) = bins(2,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,2) = bins(2,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,3) = bins(2,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,4) = bins(2,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,5) = bins(2,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,6) = bins(2,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,7) = bins(2,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.7500<=S_comp(element_number) && S_comp(element_number)<0.8750)
        bins(2,8) = bins(2,8) + 1;
        
    % Bin (1,1)
    elseif(0<=H_comp(element_number) && H_comp(element_number)<0.1250 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,1) = bins(1,1) + 1;
        
    elseif(0.1250<=H_comp(element_number) && H_comp(element_number)<0.2500 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,2) = bins(1,2) + 1;   
        
    elseif(0.2500<=H_comp(element_number) && H_comp(element_number)<0.3750 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,3) = bins(1,3) + 1;
        
    elseif(0.3750<=H_comp(element_number) && H_comp(element_number)<0.5000 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,4) = bins(1,4) + 1;
        
    elseif(0.5000<=H_comp(element_number) && H_comp(element_number)<0.6250 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,5) = bins(1,5) + 1;
        
    elseif(0.6250<=H_comp(element_number) && H_comp(element_number)<0.7500 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,6) = bins(1,6) + 1;
        
    elseif(0.7500<=H_comp(element_number) && H_comp(element_number)<0.8750 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,7) = bins(1,7) + 1;
        
    elseif(0.8750<=H_comp(element_number) && H_comp(element_number)<1.0000 && 0.8750<=S_comp(element_number) && S_comp(element_number)<1.0000)
        bins(1,8) = bins(1,8) + 1;
     
    end
    % increment the element number to move onto the next pixel in the image
    element_number = element_number + 1;
    
end


% Normalize histogram by dividing all bins by total number of pixels
bins=bins./number_pixels;