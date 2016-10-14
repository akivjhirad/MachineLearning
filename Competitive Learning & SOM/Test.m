% A function to test the 2 models. 
% P_test is a matrix of input vectors that are very similar to the input
% vectors that the model is trained on.
% P_rand is a matrix of input vectors that is very dissimilar to the input
% vectors that the model was trained on.

P_test = [1,0,0,0,0,0,0,0,0,0,0;
    1,1,0,0,0,0,0,0,0,0,0;
    1,1,1,0,0,0,0,0,0,0,0;
    1,1,1,1,0,0,0,0,0,0,0;
    1,1,1,1,1,0,0,0,0,0,0;
    1,1,1,1,1,1,0,0,0,0,0;
    0,1,1,1,1,1,1,0,0,0,0;
    0,0,1,1,1,1,1,1,0,0,0;
    0,0,0,1,1,1,1,1,1,0,0;
    0,0,0,0,1,1,1,1,1,1,1;
    0,0,0,0,0,1,1,1,1,1,1;
    0,0,0,0,0,0,1,1,1,1,1;
    0,0,0,0,0,0,0,1,1,1,1;
    0,0,0,0,0,0,0,0,1,1,1;
    0,0,0,0,0,0,0,0,0,1,1];

P_rand = zeros(15,11);
for i=1:11
    r = randi([1 15]);
    P_rand(r,i) = 1;
end

% Creating the output matrices for the training, testing, and random sets.
for i = 1:11
    O_train(:,i) = NewWeights*P(:,i);
    O_test(:,i) = NewWeights*P_test(:,i);
    O_rand(:,i) = NewWeights*P_rand(:,i);
end

% Creating vectors with the Euclidean distances between the training and
% testing outputs, and the training and random outputs.
for i = 1:11
    Dist_Train_Test(i,1) = sqrt(sum((O_train(:,i)-O_test(:,i)).^2));
    Dist_Train_Rand(i,1) = sqrt(sum((O_train(:,i)-O_rand(:,i)).^2));
end



