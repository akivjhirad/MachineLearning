% Written by: Akiv Jhirad
% Contact: akivjh@gmail.com

% Generates unique inputs using clamped hidden inputs, then calculates the
% similarity between the generated outputs and training inputs to find the
% best matching training input.

clear arr;

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

