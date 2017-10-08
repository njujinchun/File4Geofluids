function [ y ] = surrogate(x, model)
% Predict the value at x using the surrogate model

y = evaluate(model, x);

end