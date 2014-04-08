% Main execution file

% For the moment, all of the code will be in this file

n_points = 100;

% TODO: load data from a file
points_x = rand(n_points, 1);
points_y = rand(n_points, 1);

n_clusters = 5;
n_iterations = 100;

[~, ~, cluster_assignment] = kmeans(points_x, points_y, n_clusters, n_iterations);

convhull_indexes = convhull(points_x, points_y);

figure(1)
clf

hold on

% adapted from http://www.mathworks.com/matlabcentral/newsreader/view_thread/287417

scatter(points_x, points_y, 10, cluster_assignment, 'filled')


plot(points_x(convhull_indexes), points_y(convhull_indexes))

hold off
