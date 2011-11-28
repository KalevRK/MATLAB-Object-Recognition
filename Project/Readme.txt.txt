Objection Recognition Project Readme File

Kalev Roomann-Kurrik - Fall 2010
DSP Design - Rabiner

This directory contains the three MATLAB functions that I wrote for my project, as well as a few sample images to test out. The program works on any images that have row and column dimensions that are divisible by 5 (since a 5x5 block is used for processing).

The main program is called through the following call:

[prob_matrix,image_copy,points,mean] = histblock(img,row,col,color,r_dim,c_dim)

prob_matrix = probability matrix image
image_copy = copy of original image with the box drawn around it
points = the pixel coordinates of the four corners of the box as well as of the center point
mean = the mean value of the RGB colorspace inside of the box

img = string containing the filename of the image to process
row,col = row and column coordinates of the 5x5 sample block to use in processing, taken from the image passed
color = color vector to use instead of a sample block (if row,col are both zero)
r_dim = row dimension of the image
c_dim = column dimension of the image


A sample run through of the program is provided here:

>> [prob,copy,points,mean] = histblock('yellow1.jpg',277,165,0,550,440);

>> [prob,copy,points,mean] = histblock('yellow2.jpg',0,0,mean,550,440);

The program above first takes a 5x5 sample block from image "yellow1.jpg" with top-left corner at coordinates (277,165) [row,column] and uses the block as a representation of the object to find. It returns the probability matrix and a copy of the original image with a red box drawn around the recognized object.

The next command utilizes the mean value tracking. It takes the mean value returned from the first command (stored in the variable 'mean') and uses that to find the object in the second image. This could be extended indefinitely where each call to histblock returns a new mean value which can be passed into the next image in the sequence.

You can adjust the coordinates of the 5x5 sample block to use in the function call, as well as the thresholds for the probability matrix image based off of the correlation values (lines 84,87,90 in histblock.m)