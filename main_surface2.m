clear;clc;

%% Common setting
figure('position',[(1366-768)/2,0,768,768]);
% set(gca, 'color', 'black');
% set(gcf, 'color', 'black');


%% Simple Cube
a = 4;     % lattice constant.
ra = 0.2;     % radius of atom.
rb = 0.01;     % ratius of bones.
axis_limis = [-1,2,-1,2,-1,2];
axis(a*axis_limis);
axis equal;
hold on;
grid on;
% 
trans_mat = a*[1,0,0;0,1,0;0,0,1];
atoms = [0,0,0;1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1;1,1,1]';
for atom = atoms
    atom_ = atom';
    % draw atom.
    [x,y,z,c] = create_atom(coor_trans(atom_, trans_mat), ra);
    surf(x,y,z,sin(c));
    % draw bones.
    [x,y,z,c] = create_bone(atom_, atom_+[1,0,0],rb, trans_mat);
    surf(x,y,z,cos(c'));
    [x,y,z,c] = create_bone(atom_, atom_+[0,1,0],rb, trans_mat);
    surf(x,y,z,cos(c'));
    [x,y,z,c] = create_bone(atom_, atom_+[0,0,1],rb, trans_mat);
    surf(x,y,z,cos(c'));
    [x,y,z,c] = create_bone(atom_, atom_+[-1,0,0],rb, trans_mat);
    surf(x,y,z,cos(c'));
    [x,y,z,c] = create_bone(atom_, atom_+[0,-1,0],rb, trans_mat);
    surf(x,y,z,cos(c'));
    [x,y,z,c] = create_bone(atom_, atom_+[0,0,-1],rb, trans_mat);
    surf(x,y,z,cos(c'));
end
% draw simple face.
title_l = 'SC';
% alp = 1;
% [x,y,z,c] = create_parallelogram([0,0,0;1,0,0;0,1,0],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
% [x,y,z,c] = create_parallelogram([0,0,0;1,0,0;0,0,1],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
% [x,y,z,c] = create_parallelogram([0,0,0;0,1,0;0,0,1],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
% [x,y,z,c] = create_parallelogram([1,1,1;0,1,1;1,0,1],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
% [x,y,z,c] = create_parallelogram([1,1,1;0,1,1;1,1,0],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
% [x,y,z,c] = create_parallelogram([1,1,1;1,0,1;1,1,0],trans_mat);...
%     alpha(patch(x,y,z,sin(c)),alp);
colormap hsv;


%% Body-centered cube
% title_l = 'BCC';
% trans_mat = a/2*[-1,1,1;1,-1,1;1,1,-1];
% [x,y,z,c] = create_atom([1/2,1/2,1/2]*a, ra);surf(x,y,z,sin(c'));
% colormap hsv;


%% Face-centered cube
% % draw addition atoms.
% title_l = 'FCC';
% atoms = [.5,.5,0;.5,0,.5;0,.5,.5;1,0.5,0.5;.5,1,.5;.5,.5,1]';
% for atom = atoms
%     % draw atom.
%     [x,y,z,c] = create_atom(atom*a, ra);surf(x,y,z,sin(-c));
% end
% trans_mat = a/2*[0,1,1;1,0,1;1,1,0];
% colormap hsv;


%% Simple hexagonal
% a = 4;
% b = 6;
% ra = .2;
% rb = .02;
% axis_limis = [-3,3,-3,3,-2,3];
% axis(a*axis_limis);
% axis equal;
% hold on;
% grid on;
% title_l = 'SH';
% 
% trans_mat = [a,0,0;a/2,sqrt(3)*a/2,0;0,0,b];
% atoms = [0,0,0;1,-1,0;2,-1,0;2,0,0;1,1,0;0,1,0;1,0,0;0,0,1;1,-1,1;2,-1,1;2,0,1;1,1,1;0,1,1;1,0,1]';
% for atom  = atoms
%     atom_ = atom'-[1,0,0];
%     [x,y,z,c] = create_atom(coor_trans(atom_, trans_mat), ra);surf(x,y,z,sin(c));
%     [x,y,z,c] = create_bone(atom_, atom_+[1,0,0], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[0,1,0], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[0,0,1], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[1,-1,0], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[-1,0,0], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[0,-1,0], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[0,0,-1], rb, trans_mat);surf(x,y,z,cos(c'));
%     [x,y,z,c] = create_bone(atom_, atom_+[-1,1,0], rb, trans_mat);surf(x,y,z,cos(c'));
% end
% colormap hsv;

%% Common Partion
% % draw crystal system.
% for atom=create_crystal_system(trans_mat,reshape(axis_limis,[2,3])')'
%     [x,y,z,c] = create_atom(atom, ra);surf(x,y,z,sin(c));
%     
% %     % draw crystal face.
% %     [x,y,z] = create_face([atom'/trans_mat;atom'/trans_mat+[1,0,0];...
% %         atom'/trans_mat+[0,1,0]],trans_mat);alpha(surf(x,y,z,sin(z)*255),0.1);
% end

% draw crystal lattice.

% draw positive crystal lattice.
title_r = 'PL';
% [x,y,z,c] = create_bone([0,0,0],[1,0,0],rb*2,trans_mat);
% cmap = cos(c');
% surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,0],[0,1,0],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,0],[0,0,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,0],[1,1,0],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,0],[1,0,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,0],[1,1,0],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,0],[0,1,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,1],[0,1,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,1],[1,0,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,1,0],[1,1,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,1],[1,1,1],rb*2,trans_mat);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,1],[1,1,1],rb*2,trans_mat);surf(x,y,z,cmap);

% draw reciprocal lattice.
% title_r = 'RL';
rl_tm = get_rl(trans_mat);
% [x,y,z,c] = create_bone([0,0,0],[1,0,0],rb*2,rl_tm);
% cmap = zeros(size(c));
% surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,0],[0,1,0],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,0],[0,0,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,0],[1,1,0],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,0],[1,0,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,0],[1,1,0],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,0],[0,1,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,1],[0,1,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,0,1],[1,0,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,1,0],[1,1,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([1,0,1],[1,1,1],rb*2,rl_tm);surf(x,y,z,cmap);
% [x,y,z] = create_bone([0,1,1],[1,1,1],rb*2,rl_tm);surf(x,y,z,cmap);


% draw lattice face
alp_pl = 1;
alp_rl = 1;

% draw PCL face.
[x,y,z,c] = create_parallelogram([0,0,0;1,0,0;0,1,0],trans_mat);
cmap1 = ones(size(c))*0.8;
cmap2 = ones(size(c))*0.4;
cmap3 = ones(size(c))*-0.2;
alpha(patch(x,y,z,cmap1),alp_pl);
[x,y,z] = create_parallelogram([0,0,0;1,0,0;0,0,1],trans_mat);
alpha(patch(x,y,z,cmap2),alp_pl);
[x,y,z] = create_parallelogram([0,0,0;0,1,0;0,0,1],trans_mat);
alpha(patch(x,y,z,cmap3),alp_pl);

[x,y,z] = create_parallelogram([1,1,1;0,1,1;1,0,1],trans_mat);
alpha(patch(x,y,z,cmap1),alp_pl);
[x,y,z] = create_parallelogram([1,1,1;0,1,1;1,1,0],trans_mat);
alpha(patch(x,y,z,cmap2),alp_pl);
[x,y,z] = create_parallelogram([1,1,1;1,0,1;1,1,0],trans_mat);
alpha(patch(x,y,z,cmap3),alp_pl);

% % draw RL face.
% [x,y,z,c] = create_parallelogram([0,0,0;1,0,0;0,1,0],rl_tm);
% cmap1 = ones(size(c))*0.8;
% cmap2 = ones(size(c))*0.4;
% cmap3 = ones(size(c))*-0.2;
% alpha(patch(x,y,z,cmap1),alp_rl);
% [x,y,z] = create_parallelogram([0,0,0;1,0,0;0,0,1],rl_tm);
% alpha(patch(x,y,z,cmap2),alp_rl);
% [x,y,z] = create_parallelogram([0,0,0;0,1,0;0,0,1],rl_tm);
% alpha(patch(x,y,z,cmap3),alp_rl);
% 
% [x,y,z] = create_parallelogram([1,1,1;0,1,1;1,0,1],rl_tm);
% alpha(patch(x,y,z,cmap1),alp_rl);
% [x,y,z] = create_parallelogram([1,1,1;0,1,1;1,1,0],rl_tm);
% alpha(patch(x,y,z,cmap2),alp_rl);
% [x,y,z] = create_parallelogram([1,1,1;1,0,1;1,1,0],rl_tm);
% alpha(patch(x,y,z,cmap3),alp_rl);

title([title_l ' - ' title_r], 'color', 'k');
shading flat;

%% Animation
% for i=1:360
%     view(i,20);
%     drawnow;
%     M(i) = getframe(gcf);
% end
% im2gif(M, ['./gif/' lower(title_l) '_' lower(title_r) '.gif'], 1/20);