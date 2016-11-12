% This function calculated the total energy of the model
function [energy] = calcEnergy(inputState, hiddenState, weights)
    energy = 0;
    nInp = size(weights, 2); 
    nOutp = size(weights,1);
    for i = 1:nInp, 
       for j = 1:nOutp, 
          energy = energy - weights(j,i) * inputState(i,1) * hiddenState(j,1);
       end
    end
end
