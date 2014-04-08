% Main execution file

% For the moment, all of the code will be in this file

n_points = 100;

% TODO: load data from a file
points_x = rand(n_points, 1);
points_y = rand(n_points, 1);

% K-means algorithm

k = 3; % number of clusters
max_iter = 10; % rounds to run algorithm

% choose centroids to be actual points
start_points = randsample(1:n_points, k);

centroids_x = points_x(start_points);
centroids_y = points_y(start_points);

for i = 1:max_iter
    distances = zeros(k, n_points);
    
    for centroid_index = 1:k
        for point_index = 1:n_points
            % TODO: make this line readable
            distances(centroid_index, point_index) = sqrt((centroids_x(centroid_index) - points_x(point_index))^2 + (centroids_y(centroid_index) - points_y(point_index))^2);
        end
    end
    
    centroid_assignment = zeros(n_points, 1);
    
    for point_index = 1:n_points
        [~, centroid_index] = max(distances(:, point_index));
        
        centroid_assignment(point_index) = centroid_index;
    end
    
    total_x = zeros(k, 1);
    total_y = zeros(k, 1);
    
    for point_index = 1:n_points
        centroid_index = centroid_assignment(point_index);
        
        total_x(centroid_index) = total_x(centroid_index) + points_x(point_index);
        total_y(centroid_index) = total_y(centroid_index) + points_y(point_index);
    end
    
    centroids_x = total_x / n_points;
    centroids_y = total_y / n_points;
    
end

%

convhull_indexes = convhull(points_x, points_y);

plot(points_x, points_y, '.')

hold on

plot(points_x(convhull_indexes), points_y(convhull_indexes))
plot(centroids_x, centroids_y, 'r.')

hold off
