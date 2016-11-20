% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

% Present a test input pattern to the input layer, update hidden layer, then do brief 
% Gibbs sampling, alternatingly updating the input and then the hidden layer
function hiddenState = testInput(weights)
initPatterns;

inputState = testInputPatterns(:,1);

[hiddenState,hiddenProb] = forward(inputState, weights);
end