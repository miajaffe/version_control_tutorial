function color_matrix = choose_random_colors(n_colors)
% Chooses n random colors from the current color map

color_matrix = colormap();

color_matrix = color_matrix(randsample(1:length(color_matrix), n_colors), :);

end