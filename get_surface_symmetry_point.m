function [ s ] = get_surface_symmetry_point( o, surface )
%GET_SURFACE_SYMMETRY_POINT Summary of this function goes here
%   Detailed explanation goes here

a = surface(1,:);
b = surface(2,:);
v_ao = o-a;
v_ab = a-b;
l_ap = dot(v_ao,v_ab)/norm(v_ab);
v_ap = l_ap*v_ab/norm(v_ab);
v_as = v_ao-2*v_ap;
s = v_as+a;
end

