function fplot_topology(x,y)
    
    while length(x) ~= length(y)
        disp("invalid set of coordinates")
        break
    end
    %connect end and start point to close the ring
    x = [x x(1)];
    y = [y y(1)];

    n = length(x);
    
    %% compute distance matrix
    
    d_C = fdistances(x,y);
    
    
    %% plot matrix
    
    figure(2)
    heatmap(d_C)
    title("Distance Matrix of Polygon by index")
    
    %% plot as surf using index
    figure(3)
    [X, Y] = meshgrid(1:n, 1:n);  
    surf(X, Y, d_C);              
    colorbar;                      
    title('Surface Plot of Distance Matrix by coordinate index');
    xlabel('X Index');
    ylabel('Y Index');
    zlabel('Distance');
    
    %% plot as surf using values
    
    figure(4)
    [X, Y] = meshgrid(x, y);  
    surf(X, Y, d_C);         
    colorbar;                 
    title('Surface Plot of Distance Matrix by coordinate value');
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
    title("Original Shape overplotted with midpoints")
    legend show
    
    %% surf of distance using midpoint locations
    d_M = fdistances(x,y);
    d_L = d_M(:);
    figure(7)
    plot3(mid_x, mid_y, d_L);  
    colorbar;                      
    title('Surface Plot of Distance Matrix using midpoints');
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

    
end

