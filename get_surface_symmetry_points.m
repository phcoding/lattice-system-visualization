function [ sps ] = get_surface_symmetry_points( points, surface )
%GET_SURFACE_SYMMETRY_POINTS Summary of this function goes here
%   Detailed explanation goes here

count = 0;
sps = zeros(size(points));
for o = points'
    count  = count + 1;
    sps(count,:) = get_surface_symmetry_point(o', surface);
end
end

