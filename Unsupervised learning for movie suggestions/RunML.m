% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

% this function creates a new batch of inputs developed by the model when
% given a certain hidden layer activation (hidden layer can be selected in
% testHidden.m)
%%% error in code: instead of norm, similar bits should be used (should
%%% never have thought norm is a good idea cuz it makes no sense), ill fix
%%% it later
function output = RunML(weights)

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

% saves to a json so it can be integrated with nodejs
savejson('',output,'Node/data/matlabData.json');

end