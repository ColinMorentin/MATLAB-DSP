%% DSP LAB 3
LBbw = rgb2gray(longbeach); 
%gets the greyscale values of the image
row_110     = longbeach(110,:,:);
%extract the 110th row of the picture but leaves all other data
red_110     = row_110(:,:,1);
%extract the red portion of the 110th row
green_110   = row_110(:,:,2);
%extract the green portion of the 110th row
blue_110    = row_110(:,:,3);
%extract the blue of the 110th row
subplot(3,1,1);
%creates a figure matrix
n = 0:499;
%creates a index for displaying the columns of the rows
plot(n,red_110, 'r')
%plot the red portion of the row
title('Red Portion')
xlabel('column number')
ylabel('Intensity')
%minor figure labeling
subplot(3,1,2)
%new additon to figure matrix
plot(n,green_110, 'g')
%plot the green portion of the row
title('Green Portion')
xlabel('column number')
ylabel('Intensity')
%minor figure labeling
subplot(3,1,3)
%new entry to figure matrix
plot(n,blue_110, 'b');
%plot the blue portion of the row
title('Blue Portion')
xlabel('column number')
ylabel('Intensity')
%minor figure labeling
%%
subplot(2,1,1)
%figure matrix 
imshow(longbeach);
%display the original image
subplot(2,1,2)
%new entry in the figure matrix
imshow(row_110);
%display the 110th row
%%
clc
% clear the command window
subplot(3,1,1)
% figure matrix 
imshow(LBbw);
% display the original image
subplot(3,1,2)
% adding a figure to the figure matrix
row_110_BW = LBbw(110,:);
% extract the 110th row of the greyscale image
imshow(row_110_BW);
% display the 110th row of the greyscale image
subplot(3,1,3)
% adding a figure to the figure matrix
n = 0:499;
%creates a index for displaying the columns of the rows
plot(n,row_110_BW)
%plot the red portion of the row
title('BW')
xlabel('column number')
ylabel('Intensity')
%%
RotatedImage = imrotate(longbeach,30);
%rotate the original image by 30 degrees
imshow(RotatedImage);
%display the original image
%%
MaximumValue = max(max(LBbw));
%find the maximum of each row then find the maximum of these rows
MinimumValue = min(min(LBbw));
%find the minimum of each row then find the mimume of these rows
%%
xpix = 2*ones(256,1)*cos(2*pi*(0:512)/64);
%a two dimension array of cosines
imshow(xpix)
%show the two dimensional consine
%%
xpix30 = xpix(30,:);
%extract the 30th row of the two dimensional 
plot(xpix30);
%plot the 30th row 
xlabel('Column Index');
ylabel('Magntiude');
title('30th Row');
%figure labels
%%
xpixShift = 2*ones(256,1)*cos(2*pi*((0:512)/64) + pi/2);
%create a pi/2 phase shift
imshow(xpixShift)
%display the image of the phase shift
%%
xpixShift30 = xpixShift(30,:);
%extract the 30th row of the shifted cosine matrix
plot(xpixShift30);
%plot the shifted cosine matrix
%%
xpixShiftRoated = rot90(xpixShift);
%rotate the plot by 90 degrees
imshow(xpixShiftRoated)
%display the rotated matrix
%%

downscaling = LBbw(1:2:end,1:2:end); 
%skipping 2 elements of the rows and columns of the greyscale image 
subplot(1,2,1)
%figure matrix
imshow(LBbw);
%image of the original greyscale image
subplot(1,2,2)
%figure matrix
imshow(downscaling);
%image of the downscaled image

%%
xrl = (-2).^(0:6);
% signal to have image reconstruction done 
L = length(xrl);
% length of the input signal
nn = ceil((0.999:1:4.*L)./4);
% creating a new vector with an increased number of points
xrlhold = xrl(nn);
% The input signal has its original inputs copied four time 
subplot(1,2,1)
% creating a figure matrix
stem(xrl);
% the input signal
xlabel('Length of signal')
ylabel('Magnitude of Signal')
title('input');
% labels for the figure
subplot(1,2,2)
% adding to the figure matrix
stem(xrlhold);
% plotting the output signal
xlabel('Length of signal')
ylabel('Magnitude of Signal')
title('Output')
% labels for the figure

%%
[x,y] = size(downscaling);
% getting the # of rows and columns
xx = ceil((0.999:1:3.*x)./3);
% replicating the row values by three
yy = ceil((0.999:1:3.*y)./3);
% replicating the column values by three
upscaled = downscaling(xx,yy);
% perform the zero order hold
subplot(2,2,1)
% figure matrix
imshow(downscaling);
% image of the original greyscale image
subplot(2,2,3)
% figure matrix
imshow(upscaled);
% image of the downscaled image
subplot(2,2,4)
% adding a plot to the figure matrix
imshow(LBbw)
% the original image
%%
n1 = 0:6;
% exponents
xr1 = (-2).^(n1);
% original signal
tti = 0:0.1:6; 
% locations between the n1 indices 
xr1linear = interp1(n1,xr1,tti); 
% function is INTERP-ONE 
subplot(2,1,2)
% figure matrix
stem(tti,xr1linear)
% output signal
xlabel('Length of signal')
ylabel('Magnitude of Signal')
title('Output')
% labels for the figure
subplot(2,1,1)
% adding to figure matrix
stem(n1,xr1)
% input signal
xlabel('Length of signal')
ylabel('Magnitude of Signal')
title('Input')
% labels for the figure
%%
V = single(downscaling);
% recasting the image as a single
Vq = interp2(V,3);
% perform the first order hold
subplot(2,2,1)
% figure matrix
imshow(downscaling);
% the downscaled image
subplot(2,2,3)
% addign to the figure matrix
imagesc(Vq);
% displaying the image
colormap gray
% making the image grey
axis image
% changing the axis element
axis off
% removing the axis from the image
subplot(2,2,4)
% adding a plot to the figure matrix
imshow(LBbw)
% the original image


