function [ X, Y, Z, C ] = create_surface( points, trans_mat )
%CREATE_SURFACE Summary of this function goes here
%   Detailed explanation goes here

points = points*trans_mat;
X = [points(:,1)',points(1,1)];
Y = [points(:,2)',points(1,2)];
Z = [points(:,3)',points(1,3)];
C = sqrt(pow2(Z)+pow2(Y)+pow2(X));
end

