function [ex_x, ex_y] = interpolate(x, y, resolution)
    % Get the number of points
    r = resolution;
    n = length(x);
    
    % Initialize the output arrays
    ex_x = [];
    ex_y = [];
    
    % Loop through each pair of consecutive points
    for i = 1:n
        % Find the next point, wrapping around to the first point at the end
        j = mod(i, n) + 1;  % Ensures that we connect the last point to the first
        
        % Get the coordinates of the two points
        x1 = x(i);
        y1 = y(i);
        x2 = x(j);
        y2 = y(j);
        
        % Generate the interpolated points between (x1, y1) and (x2, y2)
        for t = 0:1/r:1
            % Linearly interpolate for x and y
            ex_x = [ex_x, (1 - t) * x1 + t * x2];
            ex_y = [ex_y, (1 - t) * y1 + t * y2];
        end
    end
end

