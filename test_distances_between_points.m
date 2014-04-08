% Runs tests on the distances_between_points function

% Test for a simple case

points_x = [0 1];
points_y = [0 1];

distances = distances_between_points(points_x, points_y);

% Distance to self should be 0
assert(distances(1, 1) == 0)
assert(distances(2, 2) == 0)

% Other distance should be sqrt(2)
assert(distances(1, 2) == sqrt(2))
assert(distances(2, 1) == sqrt(2))

% Matrix should be diagonal (distance from 1 to 2 is the same as 2 to 1)
assert(all(all(distances == distances')))


% Test that single points also work
points_x = 0;
points_y = 0;

distances = distances_between_points(points_x, points_y);

assert(distances == 0);
