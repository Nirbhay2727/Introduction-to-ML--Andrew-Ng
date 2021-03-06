function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

set = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
% You need to return the following variables correctly.
C = 0.01;
sigma = 0.03;
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
min_error = -1;
for ci = 1:8
    for sigmai = 1:8
        model = svmTrain(X, y, set(ci), @(x1, x2)gaussianKernel(x1, x2, set(sigmai)));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if min_error == -1 || error<min_error
            min_error = error;
            C = set(ci);
            sigma = set(sigmai);
        end
    end
end






% =========================================================================

end
