%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose: get the mean of an image sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function [Igm, dname, N] = meanActionImage()
% set the image sequence direcotry
dname = uigetdir(cd);
% read direcotry data
listing = dir(dname);
% # of images
N = length(listing)-2;
 
for i =  1 : N - 1
   %read image
   I1 = imread(strcat(dname,'\',num2str(i),'.jpeg'));
     
   %convert it to gray-scale
   if i<=1
       I2 = imread(strcat(dname,'\',num2str(i+1),'.jpeg'));
       Ig = cat(3,rgb2gray(I1),rgb2gray(I2));
   else
       Ig = cat(3,Igm,rgb2gray(I1));
   end
   
   Igm = uint8(mean(Ig,3));
end