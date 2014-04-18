function [visit_order, path_length] = find_shortest_path(points_x, points_y, n_iterations)
% Test Comment Daniel Sprockett

% Attempts to find the shortest path between a set of points (see the
% "traveling salesman" problem)

% TODO: monte-carlo solver

distances = distances_between_points(points_x, points_y);

n_points = length(points_x);

% Set self-to-self distance at infinity, since it's not a valid path
for i = 1:n_points
    distances(i, i) = inf;
end
    
% First, find the shortest path amongst all points
shortest = min(min(distances));

[rows, cols] = find(distances == shortest);

% Here is a new line!

% choose the first point (arbitrary)
p1 = rows(1);
p2 = cols(1);

% Build up a visitation order based on the next closest point to either end

visited_points = zeros(n_points, 1);
visited_points(p1) = 1;
visited_points(p2) = 1;

visit_order = [p1 p2];

while ~all(visited_points)
    closest_to_p1 = -1;
    distance_to_p1 = inf;
    
    for i = 1:n_points
        d = distances(p1, i);
        if ~visited_points(i) && d < distance_to_p1
            closest_to_p1 = i;
            distance_to_p1 = d;
        end
    end
    
    closest_to_p2 = -1;
    distance_to_p2 = inf;
    
    for i = 1:n_points
        d = distances(p2, i);
        if ~visited_points(i) && d < distance_to_p2
            closest_to_p2 = i;
            distance_to_p2 = d;
        end
    end
    
    if distance_to_p1 < distance_to_p2
        p1 = closest_to_p1;
        visit_order = [p1 visit_order];
        
        visited_points(p1) = 1;
        
    else
        p2 = closest_to_p2;
        visit_order = [visit_order p2];
        
        visited_points(p2) = 1;
        
    end
    
end

path_length = 0;

for i = 1:n_points-1
    path_length = path_length + distances(visit_order(i), visit_order(i+1));
end

end