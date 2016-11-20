% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

% Present a test pattern to the hidden layer, update input layer, then do brief 
% Gibbs sampling, alternatingly updating the hidden and then the input layer
% Test one of the hidden unit patterns to come up with an output of movies
% that a person would be interested in
function inputState = testHidden(weights)
    initPatterns;
    
    hiddenState = testHiddenPatterns(:,1);
    weights(:,1) = hiddenState;

    [inputState, inputProb] = backward(hiddenState,weights);
end


