function [convhull_x, convhull_y] = convhull_points(points_x, points_y)
% Wrapper around convhull to return points instead of indices

k = convhull(points_x, points_y);

convhull_x = points_x(k);
convhull_y = points_y(k);

end