clear variables
close all
addpath('customfunctions');

% Define coordinates for the corners of the unit square
corners = [-1,1,-1,1];  % define x min/max & y min/max
n = 25; % resolution

top_line_x = linspace(corners(1),corners(2),n);
top_line_y = corners(4)*ones(1,n);

bottom_line_x = linspace(corners(2),corners(1),n);
bottom_line_y = corners(3)*ones(1,n);

right_line_x = corners(2)*ones(1,n);
right_line_y = linspace(corners(3),corners(4),n);

left_line_x = corners(1)*ones(1,n);
left_line_y = linspace(corners(3),corners(4),n);
% or use new finterpolate()
%[x,y] = finterpolate(x,y,25)
x = [top_line_x right_line_x bottom_line_x, left_line_x];
y = [top_line_y right_line_y bottom_line_y, left_line_y];
x = [x x(1)];
y = [y y(1)];
figure(1)
plot(x,y)
ylim([corners(3)+corners(3)*0.25,corners(4)+corners(4)*0.25])
xlim([corners(1)+corners(1)*0.25,corners(2)+corners(2)*0.25])



%% compute distance matrix
d_C = fdistances(x,y);


%% plot matrix

figure(2)
heatmap(d_C)
title("Distance Matrix of Polygon")

%% plot as surf using index
figure(3)
n = n*4 + 1;
[X, Y] = meshgrid(1:n, 1:n);  
surf(X, Y, d_C);              
colorbar;                      
title('Surface Plot of Distance Matrix');
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

%% surf of distance using midpoint locations
d_M = fdistances(x,y);
d_L = d_M(:);
figure(7)


plot3(mid_x, mid_y, d_L);              
colorbar;                      
title('Surface Plot of Distance Matrix');
xlabel('x axis');
ylabel('y axis');
zlabel('Distance');


%% surf plot using midpoint and distances in matrix form

[mid_x,mid_y] = fmidpoints(x,y,"matrix");

figure(8)
surf(mid_x,mid_y,d_C)
alpha(0.5)
colorbar;                      
title('Surface Plot of Distance Matrix');
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
