clear variables
close all
addpath('customfunctions');

%% Cirlce Shape 
n = 100;
theta = linspace(0,2*pi,n);
x = cos(theta);
y = sin(3*theta);

%plot(x,y)
fplot_topology(x,y)