function output = RunML(trainingPatterns, weights)

% K = 1; % Number of steps of brief Gibbs sampling
% nHidden = 5;  % number of hidden units including the bias unit.  
%               % So for example, if we want 2 hidden units, set nHidden = 3, 
%               % if we want 4 hidden units, set nHidden = 5, etc.
% initPatterns;
% nInputs = size(trainingPatterns,1);
% nTrainingPatterns = size(trainingPatterns,3);
% epsilon = 0.05;	 % the learning rate
% weightCost = 0.0002;  % used in train.m to decay weights toward zero after each learning update
% weights = rand(nHidden, nInputs) - 0.5;  % random initial values
% nLearnReps = 100;  % Keep training in blocks of 100 learning iterations until convergence 

% find the possible generated patterns
pos = 1;
generatedPatterns = zeros(13,50);
for i = 1:size(generatedPatterns,2)
    save = 1;
    x = testHidden(weights);
    if (find(ismember(generatedPatterns(:,:)',x','rows')))
        save = 0;
    end
    if (save == 1)
        generatedPatterns(:,pos) = x;
        pos = pos + 1;
    end
end

% find the distance between each generated pattern and each training
% pattern
for i = 1:size(generatedPatterns,2)
    for j = 1:size(trainingPatterns,2)
        norm_arr(i,j) = norm(generatedPatterns(:,i) - trainingPatterns(:,j));
    end
end

% find the average of the norms of all matching training patterns, the best
% match is the one where the average distance between generated and
% training is least
for i = 1:size(trainingPatterns,2)
    match_arr(i) = mean(norm_arr(:,i));
end
[val, pos] = min(match_arr);
matchedTrainingPattern = trainingPatterns(:,pos);
matchedGeneratedPattern = generatedPatterns(:,pos);

output = matchedGeneratedPattern;

savejson('',output,'Node/data/matlabData.json');

end