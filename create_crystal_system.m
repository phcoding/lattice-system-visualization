function [ crystal_system ] = create_crystal_system( trans_mat, limits )
%CREATE_CRYSTAL_SYSTEM Summary of this function goes here
%   Detailed explanation goes here

[x,y,z] = meshgrid(limits(1,1):limits(1,2), limits(2,1):limits(2,2), ...
    limits(3,1):limits(3,2));
x = reshape(x, [numel(x),1]);
y = reshape(y, [numel(y),1]);
z = reshape(z, [numel(z),1]);
crystal_system = [x,y,z]*trans_mat;
end

