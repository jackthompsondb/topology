function [mid_x,mid_y] = fmidpoints(x,y,form)
    n = length(x);
    if form == "list"
        mid_x = zeros(n*n,1);
        mid_y = zeros(n*n,1);
        index = 0;
        for iter = 1:n
            x_1 = x(iter);
            y_1 = y(iter);
            for point = 1:n
                index=index+1;
                x_2 = x(point);
                y_2 = y(point);
                mid_x(index) = (x_1 + x_2) /2;
                mid_y(index) =(y_1 + y_2) /2;
            end
        end
    end
    if form == "matrix"
        mid_x = zeros(n,n);
        mid_y = zeros(n,n);
        for iter = 1:n
            x_1 = x(iter);
            y_1 = y(iter);
            for point = 1:n
                x_2 = x(point);
                y_2 = y(point);
                mid_x(iter,point) = (x_1 + x_2) /2;
                mid_y(iter,point) =(y_1 + y_2) /2;
            end
        end
    end
end