function distances = distances_between_points(points_x, points_y)

n_points = length(points_x);

distances = zeros(n_points);

for p1 = 1:n_points
    for p2 = 1:n_points
        distances(p1, p2) = sqrt( ...
            (points_x(p1) - points_x(p2))^2 + ...
            (points_y(p1) - points_y(p2))^2 ...
            );
    end
end

end