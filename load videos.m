[FileName,PathName,FilterIndex] = ...
     uigetfile('*.*','Video Selector', 'MultiSelect', 'on');  
 
% initialize paramaters
 X = []; tLe = []; XL = []; M = []; 
 noOfVideos = length(FileName);
 
% check if the videos are loaded or not
if FilterIndex >= 1 
    % check if it's single or multiple
    if ~strcmp(class(FileName),'char') 
         for j = 1 : noOfVideos
             filename = strcat(PathName,FileName{1,j});
           %load video
            xyloObj = VideoReader(filename);
            nFrames = xyloObj.NumberOfFrames;
            vidHeight = xyloObj.Height;
            vidWidth = xyloObj.Width;
            % Read one frame at a time.
            for i = 1 : nFrames
                % load frame 
                f  = read(xyloObj, i);
                f_bw = rgb2gray(f);   
                fr_b = imresize(f_bw, [100 100]);
                M(i,:) = reshape(fr_b,1,100*100);
            end   
            X = [X;M];
            XL = [XL; ones(size(M,1),1)*j];
         end
     end
end


X = [X XL];
save('XData.mat','X');
clear all; clc;