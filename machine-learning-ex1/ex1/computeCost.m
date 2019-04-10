function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
cost=0;
h_a=0;
h=0;
for i=1:m
  h=theta*X(i,:);
  h_a=h(1,1)+h(2,2);
  cost+=(h_a-y(i))^2;
end
J=cost/(2*m);
% =========================================================================

end
