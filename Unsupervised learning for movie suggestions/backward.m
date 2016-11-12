%  function to propagate activations from hidden layer to input layer
function [inputState,inputProb] = backward(hiddenState, weights)
   netInput = weights' * hiddenState; % use transposed weights for top-down activations
   nInputs = size(weights,2);
   inputProb = 1.0 ./ (1.0 + exp(-netInput));  % prob of unit on according to sigmoid fn
   inputState = (1.0)*(rand(nInputs,1) < inputProb); % Probabilistic Binary activations      
   inputState(nInputs,1) = 1.0;   % Always keep the final bias unit’s state equal to  1
end
