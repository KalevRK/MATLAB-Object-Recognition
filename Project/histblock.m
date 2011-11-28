function [prob_matrix,image_copy,points,mean] = histblock(img,row,col,color,r_dim,c_dim)
% Kalev Roomann-Kurrik
% Digital Signal Processing Design 
% Fall 2010 - Rabiner

% This function goes through an image with dimensions divisible by 5 one 5x5 block at a time
% It grabs a 5x5 block of the image and uses that and the sample block
% produced by the coordinates of the top-left corner in the function call 
% to determine the correlation between the image block and the sample 
% block.
% Then it uses the correlation value to set the value of a block in a
% probability output image.

% read in the image to process (row_dim x col_dim)
image = imread(img);

% row and column dimensions of image
row_dim = r_dim;
col_dim = c_dim;

% divide dimensions by 5 to get counters for rows and columns
row_count = row_dim/5;
col_count = col_dim/5;

% temp_block
temp_block = zeros(5,5,3);

% produce the sample block by using the top-left corner coordinates
% passed in the function call with a width and height of five pixels
if(row ~= 0 && col ~= 0)
    sample_block = image(row:row+4,col:col+4,:);
else
    for i=1:5
        for j=1:5
            temp_block(i,j,:) = color;
        end
    end
    sample_block = temp_block;
end


% A container matrix to hold the current block of the image being processor
container_block = ones(5,5,3);

% A variable to hold the value of the correlation from the function
% 'histcompare()'
correlation = 0;

% A vector containing the coordinates of the upper left-hand corner of the
% current 5x5 window
left_corner = [1 1];

% A matrix for storing the probability values generated from correlation of
% the sample block and the blocks taken across the entire image
prob_matrix = zeros(row_dim,col_dim);

correlation_matrix = zeros(row_count,col_count);

% Need to have a set of nested loops to go through entire image one block
% at a time and perform histogram comparison
for row=2:row_count
    % adjust row coordinate of upper left corner of current window
    left_corner(1) = (5*(row-1))+1;
    for col=2:col_count
        % adjust column coordinate of upper left corner of current window
        left_corner(2) = (5*(col-1))+1;
        
        % set the container block to grab the 5x5 subset of the image
        % need to get the RGB components of the image
        container_block(1:5,1:5,1) = image(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4),1);
        container_block(1:5,1:5,2) = image(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4),2);
        container_block(1:5,1:5,3) = image(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4),3);
        % pass the sample block and the 10x10 subset of the image to the
        % function 'histcompare()'
        correlation = histcompare(sample_block,container_block);
        correlation_matrix(row,col) = correlation;
        
        % based on a comparison of the correlation for the sample block and
        % the container block the block in the probability matrix
        % corresponding to the container block is set to some value
        % depicting the probability that the container block is part of the
        % same object as the sample block
        if(correlation < 0.018)
            prob_matrix(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4)) = 1;
            
        elseif(correlation < 0.020)
            prob_matrix(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4)) = 0.5;
            
        else
            prob_matrix(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4)) = 0;
            
        end
     
    end
end

% Remove any outliers (blocks in probability matrix with neighbor blocks
% all equal to 0
for row=2:row_count-1
    % adjust row coordinate of upper left corner of current window
    left_corner(1) = (5*(row-1))+1;
    for col=2:col_count-1
        % adjust column coordinate of upper left corner of current window
        left_corner(2) = (5*(col-1))+1;
        
        % check blocks of probability matrix
        % if non-zero then check neighbors
        % if all neighbors are zero convert the block to zero
        if(prob_matrix(left_corner(1),left_corner(2)) ~= 0)
            if((prob_matrix(left_corner(1)-1,left_corner(2)) == 0) && (prob_matrix(left_corner(1)+5,left_corner(2)) == 0) && (prob_matrix(left_corner(1),left_corner(2)-1) == 0) && (prob_matrix(left_corner(1),left_corner(2)+5) == 0))
                prob_matrix(left_corner(1):(left_corner(1)+4),left_corner(2):(left_corner(2)+4)) = 0;
            end
        
        end
    end
end

figure(1); imshow(prob_matrix);

% Use probability matrix to get top, bottom, left, and right boundaries of
% recognized object in order to draw a rectangle around the recognized
% object in a copy of the original image

% Get top boundary by going row by row from the top until you hit the first
% non-zero value, max(prob_matrix(i,:) ~= 0
r_count = 1;
top_boundary = 0;

while(top_boundary==0 && r_count <= row_dim)
    if(max(prob_matrix(r_count,:)) ~= 0)
        top_boundary = r_count;
    else
        r_count = r_count + 1;
    end
end

% Get bottom boundary
r_count = 1;
bottom_boundary = 0;

while(bottom_boundary==0 && r_count <= row_dim)
    if(max(prob_matrix(row_dim+1-r_count,:)) ~= 0)
        bottom_boundary = row_dim + 1 - r_count;
    else
        r_count = r_count + 1;
    end
end

% Get left boundary
c_count = 1;
left_boundary = 0;

while(left_boundary==0 && c_count <= col_dim)
    if(max(prob_matrix(:,c_count)) ~= 0)
        left_boundary = c_count;
    else
        c_count = c_count + 1;
    end
end

% Get right boundary
c_count = 1;
right_boundary = 0;

while(right_boundary==0 && c_count <= col_dim)
    if(max(prob_matrix(:,col_dim+1-c_count)) ~= 0)
        right_boundary = col_dim + 1 - c_count;
    else
        c_count = c_count + 1;
    end
end

% Calculate top-left corner, width, and height of rectangle

width = right_boundary-left_boundary+1;
height = bottom_boundary-top_boundary+1;

top_left_corner = [top_boundary,left_boundary];
top_right_corner = [top_boundary,right_boundary];
bottom_right_corner = [bottom_boundary,right_boundary];
bottom_left_corner = [bottom_boundary,left_boundary];

% Determine the center of the rectangle and return as output
% Can be used potentially for tracking
center = [top_boundary+(height/2),left_boundary+(width/2)];

points = [top_left_corner;top_right_corner;bottom_right_corner;bottom_left_corner;center];

% Draw a rectangle around the recognized object in a copy of the original
% image
image_copy = imread(img);

% set red component of pixel values along border to 255
% set blue and green components of pixel values along border to 0
% draws a red rectangle around recognized object

% top border and bottom border
for col=left_boundary:right_boundary
    image_copy(top_boundary,col,:) = [255,0,0];
    image_copy(bottom_boundary,col,:) = [255,0,0];
end

% left border and right border
for row=top_boundary:bottom_boundary
    image_copy(row,left_boundary,:) = [255,0,0];
    image_copy(row,right_boundary,:) = [255,0,0];
end

figure(2); imshow(image_copy);

% return the mean RGB values from the rectangular region
mean = zeros(1,1,3);

mean(1,1,1) = sum(sum(image(top_boundary:bottom_boundary,left_boundary:right_boundary,1)),2)/(width*height*255);
mean(1,1,2) = sum(sum(image(top_boundary:bottom_boundary,left_boundary:right_boundary,2)),2)/(width*height*255);
mean(1,1,3) = sum(sum(image(top_boundary:bottom_boundary,left_boundary:right_boundary,3)),2)/(width*height*255);