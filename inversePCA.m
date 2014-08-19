%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prupose: apply PCA & inverse PCA on random data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create random data
x = rand(20,9);
% apply PCA using PCA matlab built-in function
[c,dataInPCA]=princomp(x);
% count observations 
n=size(x,1);
% count dimension
ndim = size(x,2); % default, if you want to use all data dimensionality
% projet data into the original space
xhat = repmat(mean(x,1),n,1) + dataInPCA(:,1:ndim)*c(:,1:ndim)';
% original data = data mean + data in PCA space * coefficients transposed