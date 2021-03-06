% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

% Repeatedly call the function train.m from the command line until training has converged.
K = 1; % Number of steps of brief Gibbs sampling
nHidden = 5;  % number of hidden units including the bias unit.  
              % So for example, if we want 2 hidden units, set nHidden = 3, 
              % if we want 4 hidden units, set nHidden = 5, etc.
initPatterns;
nInputs = size(trainingPatterns,1);
nTrainingPatterns = size(trainingPatterns,2);
epsilon = 0.05;	 % the learning rate
weightCost = 0.0002;  % used in train.m to decay weights toward zero after each learning update
weights = rand(nHidden, nInputs) - 0.5;  % random initial values
nLearnReps = 100;  % Keep training in blocks of 100 learning iterations until convergence 
				   % (i.e. until G-error seems to be converging to a minimum, although it will bounce up and down 
				   % a bit due to stochasticity of unit states in learning equations, it should on average be 
				   % decreasing).

for i = 1:60
   [weights,G] = train(weights, nLearnReps, K, epsilon, trainingPatterns,weightCost);
end