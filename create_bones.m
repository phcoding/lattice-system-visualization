function [ X, Y, Z, C ] = create_bones( coordinate, t, p, l, r)
%CREATE_BONES Create one bone whitch starts from a point and described by
%Ball coordinates with radius of r.
%   Detailed explanation goes here

range = 20;
phi = linspace(0,2*pi, range);
h = linspace(0,l,range);
[phi, h] = meshgrid(phi, h);
X = r*cos(phi);
Y = r*sin(phi);
Z = h;

X_ = cos(t)*X+sin(t)*Z;
Z = -sin(t)*X+cos(t)*Z;

X = cos(p)*X_-sin(p)*Y;
Y = sin(p)*X_+cos(p)*Y;

X = X+coordinate(1);
Y = Y+coordinate(2);
Z = Z+coordinate(3);
C = phi;
end

