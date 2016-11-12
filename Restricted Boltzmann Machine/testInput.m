%%%%%%%%%%%%% Begin testInput.m %%%%%%%%%%%%%%%%%%%%%
% present a test input pattern to the input layer, update hidden layer, then do brief 
% Gibbs sampling, alternatingly updating the input and then the hidden layer
function hiddenState = testInput(weights)
initPatterns;

epsilon = 0.05;
weightCost = 0.0002;
K = 1;
nGibbsCycles = 1;
inputState = testInputPatterns(:,1);

nInputs = size(weights,2);
nHidden = size(weights,1);
weightDelta = zeros(nHidden,nInputs);

[hiddenState,hiddenProb] = forward(inputState, weights);
end
% weightDelta = weightDelta + epsilon * hiddenState * inputState';
% 
% % negative phase
% for cycles = 1:nGibbsCycles
%     [inputState, inputProb] = backward(hiddenState,weights);
%     [hiddenState,hiddenProb] = forward(inputState,weights);
% end
% weightDelta = weightDelta - epsilon * hiddenState * inputState';
% 
% weightDelta = weightDelta - weightCost * weights;
% weights = weights + weightDelta;

%%%%%%%%%%%%% End testInput.m %%%%%%%%%%%%%%%%%%%%
