% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

clear all;

% Initializing global variables
NumInputs = 15;
NumOutputs = 11;

W = rand(NumOutputs,NumInputs);
for i = 1:NumOutputs
    W(i,:) = W(i,:)/sum(W(i,:));
end

LearningRate = 0.1;
LearningReps = 100;

P = [1,0,0,0,0,0,0,0,0,0,0;
    1,1,0,0,0,0,0,0,0,0,0;
    1,1,1,0,0,0,0,0,0,0,0;
    1,1,1,1,0,0,0,0,0,0,0;
    1,1,1,1,1,0,0,0,0,0,0;
    0,1,1,1,1,1,0,0,0,0,0;
    0,0,1,1,1,1,1,0,0,0,0;
    0,0,0,1,1,1,1,1,0,0,0;
    0,0,0,0,1,1,1,1,1,0,0;
    0,0,0,0,0,1,1,1,1,1,0;
    0,0,0,0,0,0,1,1,1,1,1;
    0,0,0,0,0,0,0,1,1,1,1;
    0,0,0,0,0,0,0,0,1,1,1;
    0,0,0,0,0,0,0,0,0,1,1;
    0,0,0,0,0,0,0,0,0,0,1];

% To train with competitive learning
NewWeights = Train(W, P, LearningRate, LearningReps, 'competitive');

% To train with SOM
% NewWeights = Train(W, P, LearningRate, LearningReps);




