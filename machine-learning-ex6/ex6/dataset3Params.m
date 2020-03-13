function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%{
paramList = [0.01 0.03 0.1 0.3 1 3 10 30](:);
error=zeros(64, 3);
ind = 1;
x1=X(:, 1);
x2=X(:, 2);
for c=1:size(paramList,1)
  for s=1:size(paramList,1)
    model = svmTrain(X, y, paramList(c), @(x1, x2) gaussianKernel(x1, x2, paramList(s)));
    pred = svmPredict(model, Xval);
    error(ind, 1) = paramList(c);
    error(ind, 2) = paramList(s);
    error(ind, 3) = mean(double(pred ~= yval));
    ind += 1;

[v i] = min(error(:, 3));
C = error(i, 1);
sigma = error(i, 2);
  end
end
%}
C = 1;
sigma = 0.1;
% =========================================================================

end
