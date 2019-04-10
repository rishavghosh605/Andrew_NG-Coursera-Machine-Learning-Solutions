function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
prediction_error=[];
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
%0.01, 0.03, 0.1, 0.3, 1, 3, 10, 3
C_test = [0.01 0.03 0.1 0.3 1, 3, 10 30];
sigma_test = [0.01 0.03 0.1 0.3 1, 3, 10 30];

for i=1:length(C)
  for j=1:length(sigma)
    model= svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
    predictions = svmPredict(model, Xval);
    prediction_error(i,j)=mean(double(predictions ~= yval));
  end
end
hypertune=[1,1];
min_pred=prediction_error(1,1);
for i=1:length(C)
  for j=1:length(sigma)
    if min_pred>prediction_error(i,j)
      hypertune=[i,j];
      min_pred=prediction_error(i,j);
    endif
  endfor
endfor

C=C(hypertune(1));
sigma=sigma(hypertune(2));
% =========================================================================

end
