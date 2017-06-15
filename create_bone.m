function [ X, Y, Z, C ] = create_bone( cstart, cend, radius, varargin )
%CREATE_BONE Create one bone between two point on a special coordinate
%described by transformation matrix and return surface matrix data on
%Cartesian  coordinates.
%   Detailed explanation goes here

if length(varargin) == 1
    trans_mat = varargin{1};
else
    trans_mat = [1,0,0;0,1,0;0,0,1];
    disp('Warning: trans_mat param error ! defult to using cartesian coordinates !');
end
cstart_c = cstart*trans_mat;
cend_c = cend*trans_mat;
vector_c = cend_c - cstart_c;
l = norm(vector_c);
t = acos(vector_c(3)/l);
if norm(vector_c(1:2)) ~= 0
    if vector_c(2) >= 0
        p = acos(vector_c(1)/norm(vector_c(1:2)));
    else
        p = -acos(vector_c(1)/norm(vector_c(1:2)));
    end
else
    p = 0;
end
[X, Y, Z, C] = create_bones(cstart_c, t, p, l, radius);
end

