function [ cc ] = coor_trans( c, trans_mat )
%COOR_TRANS Get Cartesian coordinate from another coordinate by
%transformation matrix.
%   Detailed explanation goes here

cc = c*trans_mat;
end

