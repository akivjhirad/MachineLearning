% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

function [NewWeights] = Train(OldWeights,InputPattern, LearningRate,...
    NumIterations, Model)

% A function that trains the network and returns the new set of weights, 
% as a function of the previous weight matrix, input pattern matrix, 
% learning rate and number of learning iterations. 

% Parameter "Model" is which model you want to use, default is Kohonen

NumPatterns = size(InputPattern,2);
s = size(OldWeights);

% Pure competitive learning
if (nargin > 4)
    disp('Using competitive learning model');
    for rep = 1:NumIterations
        for p = 1:NumPatterns
            InputAC = InputPattern(:,p);
            OutputAC = WinnerTakeAll(OldWeights, InputAC);
            [~, idx] = max(OutputAC);
            SumInput = sum(InputAC);
            DeltaW = LearningRate*InputAC'/SumInput - LearningRate*OldWeights(idx,:);
            OldWeights(idx,:) = OldWeights(idx,:)+DeltaW;
        end
    end

% Kohonen model
else
    disp('Using Kohonen learning model');
    DeltaW = zeros(11,15);
    for rep = 1:NumIterations
        for p = 1:NumPatterns
            InputAC = InputPattern(:,p);
            OutputAC = WinnerTakeAll(OldWeights, InputAC);
            [~, idx] = max(OutputAC);
            SumInput = sum(InputAC);
            
            for row = 1:s(1) 
                DeltaW(row,:) = LearningRate.*(InputAC'/SumInput - OldWeights(row,:));
                if (row ~= idx)
                    DeltaW(row,:) = DeltaW(row,:)./abs(row-idx);
                end
            end
            OldWeights = OldWeights + DeltaW;
        end
    end
end

NewWeights = OldWeights;

