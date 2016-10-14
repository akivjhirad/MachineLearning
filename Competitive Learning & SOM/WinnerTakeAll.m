% A function that computer the output activations of a layer of neurons as
% a function of the weights of an input pattern.

function [OutputActivations] = WinnerTakeAll(WeightMatrix, InputPattern)

NetInput = WeightMatrix*InputPattern;
OutputActivations = NetInput == max(NetInput);  