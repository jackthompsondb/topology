clear variables
close all
addpath('customfunctions');

% Parameters
n_points = 100; % Number of points to consider in the range
x = linspace(0, 1, n_points); % Generate values between 0 and 1
y = zeros(size(x)); % Initialize y values

% Calculate Thomae's function
n = 400;
lim = 100;
a = 1;
b = 7;
x = linspace(0,2*pi,n);
terms = zeros(1,lim);
for i = 1:n
    for k = 1:lim
        terms(i) = a^k * cos(b^k*pi.*x(i));
    end
    y(i) = sum(terms);
end

%plot(x,y)
fplot_topology(x,y)