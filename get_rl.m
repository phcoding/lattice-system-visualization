function [ rl_tm ] = get_rl( pl_tm )
%GET_RL Get Reciprocal Lattice from Positive crystal lattice
%transformation matrix.
%   RL_TM = GET_RL( PL_TM )
%   argsin:
%       pl_tm       Positive crystal lattice transformation matrix.
%   argsout:
%       rl_tm       Reciprocal Lattice transformation matrix.

rl_tm(1,:) = 2*pi*cross(pl_tm(2,:), pl_tm(3,:))/dot(pl_tm(1,:), cross(pl_tm(2,:), pl_tm(3,:)));
rl_tm(2,:) = 2*pi*cross(pl_tm(3,:), pl_tm(1,:))/dot(pl_tm(2,:), cross(pl_tm(3,:), pl_tm(1,:)));
rl_tm(3,:) = 2*pi*cross(pl_tm(1,:), pl_tm(2,:))/dot(pl_tm(3,:), cross(pl_tm(1,:), pl_tm(2,:)));
end

