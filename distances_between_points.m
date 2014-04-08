function distances = distances_between_points(points_x, points_y)
% Returns distances between points for all combinations of points as a
% matrix

n_points = length(points_x);

distances = zeros(n_points);

for p1 = 1:n_points
    for p2 = p1+1:n_points
        distances(p1, p2) = sqrt( ...
            (points_x(p1) - points_x(p2))^2 + ...
            (points_y(p1) - points_y(p2))^2 ...
            );
    end
end

distances = distances + distances';

end