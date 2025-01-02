clear variables
close all
%% Polygon shape
x = [-1.1536964980544748, -1.0642023346303504, -1.1964980544747084, -0.97859922178988334, -1.2626459143968873, -1.029182879377432, -1.313229571984436, -0.86186770428015591, -1.0758754863813231, -1.068093385214008, -0.51167315175097294, -0.80739299610894943, -0.80350194552529186, -0.24319066147859947, -0.14980544747081725, -0.0058365758754865826, -0.23151750972762675, 0.040856031128404968, -0.22762645914396917, -0.49221789883268507, -0.41439688715953316, -0.53501945525291839, -0.64007782101167332, -0.7684824902723737, -0.88521400778210135, -1.0758754863813231];
y = [-0.79571984435797605, -0.75680933852140075, -0.67509727626459171, -0.51945525291828787, -0.33268482490272389, -0.26653696498054491, -0.060311284046692615, -0.052529182879377467, 0.21206225680933843, 0.20428015564202329, -0.048638132295719894, 0.33268482490272366, 0.33268482490272366, -0.16926070038910512, -0.0019455252918290089, -0.34435797665369661, -0.36770428015564205, -0.57392996108949434, -0.72178988326848259, -0.63618677042801552, -0.77626459143968862, -0.78793774319066179, -0.72178988326848259, -0.81128404669260723, -0.75291828793774318, -0.83463035019455267];
x = [x x(1)];
y = [y y(1)];
[x,y] = finterpolate(x,y,10);

num_decimal_places = 1:30;

figure(1)
for n = num_decimal_places
    x_r = round(x, n);
    y_r = round(y, n);
    error = mean((x - x_r).^2 + (y - y_r).^2);
    subplot(2,1,1)
    hold on
    plot(x_r,y_r,"--","DisplayName",sprintf("n=%d",n))
    title("original polygon for each no. of decimal rounded")
    subplot(2,1,2)
    hold on
    scatter(n,error,"DisplayName",sprintf("n=%d",n))
    title("no. decimal values vs rounding error")
    ylabel("error ")
    yscale("log")
    legend("show","Orientation","horizontal","NumColumns",6)
end
hold off

% From viewing data the ideal decimal place is 19
x = round(x,19);
y = round(y,19);
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