function [ X,Y,Z,C ] = create_parallelogram( points, trans_mat )
%CREATE_PARALLELOGRAM Summary of this function goes here
%   Detailed explanation goes here
[X,Y,Z,C] = create_surface([points(1,:);points(2,:);...
    points(2,:)+points(3,:)-points(1,:);points(3,:)], trans_mat);
end

