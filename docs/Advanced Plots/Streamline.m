%%
% This is an example of how to visualize vector fields with streamlines in MATLAB&#174;. Vector fields contain vector information for every point in space. For example, air flow data inside a wind tunnel is a vector field.
% 
% Read about the <http://www.mathworks.com/help/matlab/ref/streamline.html |streamline|> and <http://www.mathworks.com/help/matlab/ref/coneplot.html |coneplot|> functions in the MATLAB documentation.
%
% For more examples, go to <http://www.mathworks.com/discovery/gallery.html MATLAB Plot Gallery>
%
% Copyright 2012-2014 The MathWorks, Inc.

% Load wind data
load wind x y z u v w

figure

% Create streamline
[sx, sy, sz] = meshgrid(min(x(:)), linspace(20, 40, 3), linspace(5, 15, 3));
hhh = streamline(x, y, z, u, v, w, sx, sy, sz);
hold on

% Plot start point of the streamlines
plot3(sx(:), sy(:), sz(:), 'bo', 'MarkerFaceColor', 'b')

grid on
box on
view(-30, 60)

% Add velocity cones on top of the streamlines to indicate the velocity
% along the lines.

% Get X/Y/Z data for the stream lines
xx = get(hhh, 'XData'); 
yy = get(hhh, 'YData');
zz = get(hhh, 'ZData');

% Place 5 velocity cones per stream line
fcn = @(c) c(round(linspace(1, length(c), 5)));
xx = cellfun(fcn, xx, 'UniformOutput', false);
yy = cellfun(fcn, yy, 'UniformOutput', false);
zz = cellfun(fcn, zz, 'UniformOutput', false);

% Create coneplot
hhh2 = coneplot(x, y, z, u, v, w, [xx{:}], [yy{:}], [zz{:}], 3);
set(hhh2, 'FaceColor', 'r', 'EdgeColor', 'none')
camlight
lighting gouraud
