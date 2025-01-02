clear variables
close all
addpath('customfunctions');

% Read the distance matrix from the text file
distance_matrix = dlmread('C:\Users\dbjac\Desktop\MATLAB\research\topology\py\dtm.txt', ',');
disp('Distance Matrix:');
disp(distance_matrix);
d_C = distance_matrix;

% Display the matrix using spectral or circulator coordinates

% Circular
% coords_c = dlmread('C:\Users\dbjac\Desktop\MATLAB\research\topology\py\50circular_layout.txt', ',');
% x = coords_c(:,1);
% y = coords_c(:,2);

% Spectral
coords_c = dlmread('C:\Users\dbjac\Desktop\MATLAB\research\topology\py\50spectral_layout.txt', ',');
x = coords_c(:,1);
y = coords_c(:,2);


n = length(x);


%% plot matrix

figure(2)
heatmap(d_C)
title("Distance Matrix of Polygon")

%% plot as surf using index
figure(3)
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
scatter(x,y,"LineWidth",2,"DisplayName","original shape")
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



