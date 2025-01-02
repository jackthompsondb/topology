clear variables
close all
addpath('customfunctions');

%% Cirlce Shape 
center_x = 0;
center_y = 0; % y-coordinate of the center
radius = 10;  % Radius of the circle

% Number of points to approximate the circle
n = 100; 

% Generate points
theta = linspace(0, 2*pi, n); % Angles from 0 to 2π
x = center_x + radius * cos(theta); % X coordinates
y = center_y + radius * sin(theta); % Y coordinates
x = [x x(1)];
y = [y y(1)];
n = length(x);
%% compute distance matrix
d_C = fdistances(x,y);
%% plot matrix

figure(2)
heatmap(d_C)
title("Distance Matrix of Polygon")

%% plot as surf using index
figure(3)
[X, Y] = meshgrid(1:n, 1:n);  
surf(X, Y, d_C);              
colorbar;                      
title('Surface Plot of Distance Matrix ');
xlabel('X Index');
ylabel('Y Index');
zlabel('Distance');

%% plot as surf using values

figure(4)
[X, Y] = meshgrid(x, y);  
surf(X, Y, d_C);         
colorbar;                 
title('Surface Plot of Distance Matrix');
xlabel('X Coordinate');
ylabel('Y Coordinate');
zlabel('Distance');

%% countour plots 
figure(5)

levels = linspace(min(d_C(:))+0.05, max(d_C(:))-0.05, 9);
colormap = parula(numel(levels)); 
index = 0;
for level = levels
    index = index + 1;
    subplot(3,3,index);
    hold on
    contour(X,Y,d_C,[level level],"LineColor",colormap(index,:));
    title(sprintf("level =%d",index))
end

%% midpoints as coordinates

[mid_x,mid_y] = fmidpoints(x,y,"list");
figure(6)
hold on
plot(mid_x,mid_y,"DisplayName","midpoints")
plot(x,y,"LineWidth",2,"DisplayName","original shape")
legend show

%% 3dplot of distance using midpoints and distances in list form
d_L = d_C(:);


figure(7)
plot3(mid_x, mid_y, d_L);              
title('Line Plot of Distance Matrix');
xlabel('x axis');
ylabel('y axis');
zlabel('Distance');

%% surf plot using midpoint and distances in matrix form

[mid_x,mid_y] = fmidpoints(x,y,"matrix");

figure(8)
surf(mid_x,mid_y,d_C)
alpha(0.5)
colorbar;                      
title('Surface Plot of Distance Matrix using midpoints');
xlabel('x axis');
ylabel('y axis');
zlabel('Distance');

%% countour plots again
figure(9)

levels = linspace(min(d_C(:))+0.05, max(d_C(:))-0.05, 9);
colormap = parula(numel(levels)); 
index = 0;
for level = levels
    index = index + 1;
    subplot(3,3,index);
    hold on
    contour(mid_x,mid_y,d_C,[level level],"LineColor",colormap(index,:));
    title(sprintf("level =%d",index))
end
