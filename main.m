% Main execution file

% For the moment, all of the code will be in this file

n_points = 100;

% TODO: load data from a file
points_x = rand(n_points, 1);
points_y = rand(n_points, 1);

n_clusters = 5;
n_iterations = 100;

[~, ~, cluster_assignment] = kmeans(points_x, points_y, n_clusters, n_iterations);

cluster_points_x = {};
cluster_points_y = {};

for cluster_index = 1:n_clusters
    points_in_cluster = (cluster_index == cluster_assignment);
    
    cluster_points_x{cluster_index} = points_x(points_in_cluster);
    cluster_points_y{cluster_index} = points_y(points_in_cluster);
end

convhull_indexes = convhull(points_x, points_y);

cluster_colors = choose_random_colors(n_clusters);

figure(1)
clf

hold on

for cluster_index = 1:n_clusters
    x = cluster_points_x{cluster_index};
    y = cluster_points_y{cluster_index};
    
    plot(x, y, '.', 'markersize', 20, 'color', cluster_colors(cluster_index, :))
end


plot(points_x(convhull_indexes), points_y(convhull_indexes))

hold off
