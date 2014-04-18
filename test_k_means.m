% Tests kmeans.m

points_x = [0 0.1 -0.1 1 1.1 0.9];
points_y = [0 0.1 -0.1 1 1.1 0.9];
n_clusters = 2;
max_iterations = 100;
tutorial_Var = 1;

[centroids_x, centroids_y, cluster_assignment] = kmeans(points_x, points_y, ...
    n_clusters, max_iterations);

[centroids_x, sorting] = sort(centroids_x);
centroids_y = centroids_y(sorting);

assert(all(centroids_x == [0; 1]));
assert(all(centroids_y == [0; 1]));

assert( ...
    all(cluster_assignment == [1 1 1 2 2 2]') || ...
    all(cluster_assignment == [2 2 2 1 1 1]') ...
    )
