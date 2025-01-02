clear variables
close all
addpath('customfunctions');

% Parameters
n_points = 100;
x = linspace(0,2*pi,n_points);
y = sin(x);

fplot_topology(x,y)