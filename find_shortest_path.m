function [visit_order, path_length] = find_shortest_path(points_x, points_y, n_iterations)
% Attempts to find the shortest path between a set of points (see the
% "traveling salesman" problem)

distances = distances_between_points(points_x, points_y);

n_points = length(points_x);

% Choose a random visit order

visit_order = randperm(n_points);

path_length = calculate_path_length(visit_order, distances);

for i = 1:n_iterations
    % Choose two points and swap
    temp = randperm(n_points);
    points = temp(1:2);
    
    new_visit_order = visit_order;
    
    new_visit_order(points) = new_visit_order(fliplr(points));
    
    new_path_length = calculate_path_length(new_visit_order, distances);
    
    %if new_path_length/path_length-1 < log(rand+1)
    if new_path_length < path_length
        visit_order = new_visit_order;
        path_length = new_path_length;
    end
end

end

function path_length = calculate_path_length(visit_order, distances)

n_points = length(visit_order);

path_length = 0;

for i = 1:n_points-1
    path_length = path_length + distances(visit_order(i), visit_order(i+1));
end

end