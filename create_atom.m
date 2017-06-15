function [ X, Y, Z, C ] = create_atom( coordinate, r)
%CREATE_ATOM Create one atom and return surface matrix data.
%   Detailed explanation goes here

range = 100;
% phi =linspace(0,2*pi,range);
% thet = linspace(0,pi,range);
% [phi,thet] = meshgrid(phi, thet);
% X = r*sin(thet).*cos(phi);
% Y = r*sin(thet).*sin(phi);
% Z = r*cos(thet);
% C = sin(X+Y+Z);
[X,Y,Z] = sphere(range);
C = sin((X+Y+Z)/3);
X = r*X + coordinate(1);
Y = r*Y + coordinate(2);
Z = r*Z + coordinate(3);
end

