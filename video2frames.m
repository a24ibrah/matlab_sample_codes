%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read video, extract frames and save them into a given directory.
% Input: none
% Output: Path, Number of frames and File names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
function [imPath,numFrames,FileName] = readFrames()
 
% loading action video
[FileName,PathName] = uigetfile('*.avi','Select the Action file');
vid = strcat(PathName,FileName);
 
% init video object
readerobj = mmreader(vid);
% read video
vidFrames = read(readerobj);
% gget# of frames
numFrames = get(readerobj, 'numberOfFrames');
tn = FileName(1:end-4);
 
[FileName,PathNameDir] = uiputfile;
D = PathNameDir;
imPath = strcat(D,'\',tn);
mkdir(imPath);
 
for k = 1 : numFrames
mov(k).cdata = vidFrames(:,:,:,k);
mov(k).colormap = [];
%imshow(mov(k).cdata);
imagename=strcat(int2str(k), '.jpeg');
imwrite(mov(k).cdata, strcat(imPath,'\',imagename));
%extractComponents(mov(k).cdata);
 
end