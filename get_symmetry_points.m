function [ sps ] = get_symmetry_points( points, line )
%GET_SYMMETRY_POINTS Summary of this function goes here
%   Detailed explanation goes here

count = 0;
sps = zeros(size(points));
for o = points'
    count  = count + 1;
    sps(count,:) = get_symmetry_point(o', line);
end
end

