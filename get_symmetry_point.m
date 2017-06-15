function [ s ] = get_symmetry_point( o, line )
%GET_SYMMETRY_POINT Summary of this function goes here
%   Detailed explanation goes here

 a = line(1,:);
 b = line(2,:);
 v_ab = b-a;
 v_ao = o-a;
 l_ap = dot(v_ao,v_ab)/norm(v_ab);
 v_ap = l_ap*v_ab/norm(v_ab);
 v_po = v_ao-v_ap;
 v_as = v_ao-2*v_po;
 s = v_as + a;
end

