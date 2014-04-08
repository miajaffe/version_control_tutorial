% Script that generates the fake data for the example, then saves it to 
% an Excel file

n_points = 1000;
n_distributions = 10;

deviation = 0.05;

points_x = zeros(n_points, 1);
points_y = zeros(n_points, 1);

point_index = 1;

for i_dist = 1:n_distributions
    mean_x = rand;
    mean_y = rand;
    
    for p = 1:floor(n_points/n_distributions)
        points_x(point_index) = mean_x + deviation * randn;
        points_y(point_index) = mean_y + deviation * randn;
        
        point_index = point_index + 1;
    end
end

plot(points_x, points_y, '.')

points = [points_x points_y];

xlswrite('data.xls', points)
