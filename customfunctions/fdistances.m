function d_M = fdistances(x,y)
    n = length(x);
    d_M = zeros(n,n);
    index = 0;
    for iter = 1:n
        x_1 = x(iter);
        y_1 = y(iter);
        for point = 1:n
            index=index+1;
            x_2 = x(point);
            y_2 = y(point);
            d_M(iter,point) = sqrt((x_1-x_2)^2 +(y_1-y_2)^2);
        end
    end
end

