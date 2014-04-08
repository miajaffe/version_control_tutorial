% Main execution file

% For the moment, all of the code will be in this file

n_points = 100;

% TODO: load data from a file
points_x = rand(n_points, 1);
points_y = rand(n_points, 1);

convhull_indexes = convhull(points_x, points_y);

plot(points_x, points_y, '.')

hold on

plot(points_x(convhull_indexes), points_y(convhull_indexes))

hold off
