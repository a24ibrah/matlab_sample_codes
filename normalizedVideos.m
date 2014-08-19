function [X,eachVideoLength] = normalizedVideos()
[FileName,PathName,FilterIndex] = ...
     uigetfile('*.*','Video Selector', 'MultiSelect', 'on');  
 
% initialize paramaters
 X = []; 
 XL = []; 
 eachVideoLength =[];
 noOfVideos = length(FileName);
 
% check if the videos are loaded or not
if FilterIndex >= 1 
    % check if it's single or multiple
    if ~strcmp(class(FileName),'char') 
         for j = 1 : noOfVideos
             M = []; 
             filename = strcat(PathName,FileName{1,j});
           %load video
            xyloObj = VideoReader(filename);
            nFrames =0; 
            nFrames = xyloObj.NumberOfFrames;
            vidHeight = xyloObj.Height;
            vidWidth = xyloObj.Width;
            % Read one frame at a time.
            for i = 1 : nFrames
                % load frame 
                f  = read(xyloObj, i);
                % convert into gray-scale
                f_bw = rgb2gray(f);   
                % scale the images
                fr_b = imresize(f_bw, [25 25]);
                %M(i,:) = reshape(fr_b,1,25*25);
                M = [M; double(fr_b(:))'];
            end   
            % get mean image
            Mmn = mean(M,2);
            %subtract the mean
            M = M - repmat(Mmn,1,size(M,2));
            % normalize the videos
            Msum = sqrt(sum(M.^2,2));
            M = M./repmat(Msum,1,size(M,2));
            % load data matrix
            X = [X;M]; 
            % label videos
            XL = [XL; ones(size(M,1),1)*j];
            eachVideoLength = [eachVideoLength; nFrames];
         end
     end
end


X = [X XL];
% save('XData.mat','X');
% clear all; clc;