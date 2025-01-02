clear variables
close all
addpath('customfunctions');

%% Cirlce Shape 
x = [ 0.001945525291829231,...
 -0.50000000000000022,...
 -1.2548638132295722,...
 -0.65953307392996119,...
 -0.63618677042801575,...
 -0.07587548638132291,...
 0.33657587548638102,...
 0.60505836575875449,...
 1.1887159533073923,...
 0.39105058365758705,...
];
y= [ 0.81906614785992282,...
 0.19649805447470814,...
 0.16147859922178975,...
 -0.30544747081712065,...
 -0.83852140077821025,...
 -0.32490272373540874,...
 -0.78015564202334664,...
 -0.27042801556420248,...
 -0.033073929961089599,...
 0.23540856031128388,...
];
[x,y] = finterpolate(x,y,10);
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
