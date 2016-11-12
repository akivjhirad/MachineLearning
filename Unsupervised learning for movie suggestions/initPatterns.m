% The input training patterns represent input from 28 users for 12 movies chosen from 
% Amazon EC2 MovieLens dataset.  
% Each row below is one training pattern consisting of one user�s ratings, but in the
% last line the matrix is transposed so that now each column is one training pattern.
% The final element of each training pattern is a �1� representing the bias units� output. 
trainingPatterns = ...
[1 1 1 0 0 0 0 0 0 1 0 0   1; ...
 1 1 1 0 0 0 1 0 0 0 0 0   1; ...
 1 1 0 1 0 0 0 0 0 0 0 0   1; ...
 0 1 1 0 1 0 0 0 0 0 0 0   1; ...
 1 1 1 0 0 0 0 0 0 0 1 0   1; ...
 1 0 1 0 0 1 0 0 1 0 0 1   1; ...
 1 1 1 0 0 0 0 1 0 0 0 0   1; ...
 1 0 0 1 1 1 0 0 0 0 0 0   1; ...
 0 0 1 1 0 1 0 0 0 0 0 0   1; ...
 0 0 0 1 1 0 1 0 0 0 0 0   1; ...
 0 0 0 0 1 1 0 0 1 0 0 1   1; ...
 0 1 0 1 1 1 0 1 0 0 1 0   1; ...
 0 0 0 0 1 1 0 0 0 1 0 0   1; ...
 0 1 0 1 1 0 0 1 0 0 0 0   1; ...
 0 0 0 1 0 0 1 1 1 0 0 0   1; ...
 0 0 0 0 0 0 1 0 1 0 0 1   1; ...
 0 1 0 0 0 0 1 1 0 0 0 0   1; ...
 0 0 0 0 1 0 0 1 1 0 0 0   1; ...
 0 0 0 0 0 0 1 1 1 0 1 0   1; ...
 0 0 0 0 0 0 1 0 1 0 0 0   1; ...
 0 0 1 0 0 0 1 1 0 0 0 0   1; ...
 0 0 0 0 1 0 0 0 0 1 1 1   1; ...
 0 1 0 0 0 0 1 0 0 1 0 1   1; ...
 0 0 0 1 0 0 0 0 0 1 1 0   1; ...
 1 0 0 0 0 0 0 0 0 0 1 1   1; ...
 0 0 0 0 0 1 0 0 1 1 1 1   1; ...
 0 0 1 0 0 0 0 0 0 1 0 1   1; ...
 0 0 0 0 0 0 0 1 0 1 1 0   1; ...
]';

testInputPatterns  = [...
 1 1 1 0 0 0 0 0 0 0 0 0 1;...
 0 0 0 1 1 1 0 0 0 0 0 0 1;...
 0 0 0 0 0 0 1 1 1 0 0 0 1;...
 0 0 0 0 0 0 0 0 0 1 1 1 1]';

testHiddenPatterns  = [...
 1 0 0 0 1;...
 0 1 0 0 1;...
 0 0 1 0 1;...
 0 0 0 1 1]';