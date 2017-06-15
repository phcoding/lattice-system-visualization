clear;clc;

%% Common setting
figure('position',[(1366-768)/2,0,768,768]);
% set(gca, 'color', 'black');
% set(gcf, 'color', 'black');


%% Simple Cube
a = 4;     % lattice constant.
ra = 0.2;     % radius of atom.
rb = 0.02;     % ratius of bones.
axis_limis = [-1,2,-1,2,-1,2];
axis(a*axis_limis);
axis equal;
hold on;
grid on;
trans_mat = a*[1,0,0;0,1,0;0,0,1];
atoms = [0,0,0;1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1;1,1,1]';
for atom = atoms
    atom_ = atom';
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
% draw wigner
title_l = 'SC';
alp = 1;
p1 = [1/2,1/2,1/2];
p2 = [-1/2,1/2,1/2];
p3 = [-1/2,-1/2,1/2];
p4 = [1/2,-1/2,1/2];
f1 = [p1;p2;p3;p4];
[x,y,z,c] = create_surface(f1, trans_mat);
cmap1 = ones(size(c))*0.8;
cmap2 = ones(size(c))*0.4;
cmap3 = ones(size(c))*-0.2;
alpha(patch(x,y,z,cmap3),alp);
f2 = get_surface_symmetry_points(f1,[0,0,0;0,1,1]);
[x,y,z] = create_surface(f2, trans_mat);
alpha(patch(x,y,z,cmap1),alp);
f3 = get_surface_symmetry_points(f1,[1/2,0,1/2;0,0,1]);
[x,y,z] = create_surface(f3, trans_mat);
alpha(patch(x,y,z,cmap2),alp);
f4 = get_surface_symmetry_points(f1,[0,0,0;0,0,1]);
[x,y,z] = create_surface(f4, trans_mat);
alpha(patch(x,y,z,cmap3),alp);
f5 = get_surface_symmetry_points(f2,[0,0,0;0,1,0]);
[x,y,z] = create_surface(f5, trans_mat);
alpha(patch(x,y,z,cmap1),alp);
f6 = get_surface_symmetry_points(f3,[0,0,0;1,0,0]);
[x,y,z] = create_surface(f6, trans_mat);
alpha(patch(x,y,z,cmap2),alp);
colormap hsv;


%% Body-centered cube
% % draw wigner
% title_l = 'BCC';
% alp = 1;
% o1 = [1/2,0,1/4];
% o2 = [3/4,0,1/2];
% o3 = [1/2,0,3/4];
% o4 = [1/4,0,1/2];
% f1 = [o1;o2;o3;o4];
% % front
% [x,y,z,c] = create_surface(f1, trans_mat);
% cmap3 = ones(size(c))*-0.2;
% alpha(patch(x,y,z,cmap3),alp);
% % back
% f2 = get_surface_symmetry_points(f1, [1/2,1/2,0;1/2,0,0]);
% [x,y,z] = create_surface(f2, trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% % left
% f3 = get_surface_symmetry_points(f1, [1/2,1/2,0;1,0,0]);
% [x,y,z] = create_surface(f3, trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% % right
% f4 = get_surface_symmetry_points(f1, [1/2,1/2,0;0,0,0]);
% [x,y,z] = create_surface(f4, trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% % top
% f5 = get_surface_symmetry_points(f1, [1/2,1/2,1/2;1/2,0,0]);
% [x,y,z] = create_surface(f5, trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% % bottom
% f6 = get_surface_symmetry_points(f1, [1/2,1/2,1/2;1/2,0,1]);
% [x,y,z] = create_surface(f6, trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% 
% 
% f7 = [f1(1,:);f6(1,:);f6(2,:);f4(1,:);f4(2,:);f1(2,:)];
% [x,y,z,c] = create_surface(f7, trans_mat);
% cmap1 = ones(size(c))*0.8;
% cmap2 = ones(size(c))*0.4;
% cmap3 = ones(size(c))*-0.2;
% alpha(patch(x,y,z,cmap1),alp);
% f8 = get_surface_symmetry_points(f7, [1/2,1/2,1/2;1/2,1/2,1]);
% [x,y,z] = create_surface(f8, trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f9 = get_surface_symmetry_points(f7, [1/2,1/2,1/2;1,1/2,0]);
% [x,y,z] = create_surface(f9, trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% f10 = get_surface_symmetry_points(f7, [1/2,1/2,1/2;1,1/2,1/2]);
% [x,y,z] = create_surface(f10, trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% 
% f11 = get_surface_symmetry_points(f7, [1/2,1/2,1/2;1/2,0,0]);
% [x,y,z] = create_surface(f11, trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% f12 = get_surface_symmetry_points(f10, [1/2,1/2,1/2;1/2,0,0]);
% [x,y,z] = create_surface(f12, trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f13 = get_surface_symmetry_points(f8, [1/2,1/2,1/2;1/2,0,1]);
% [x,y,z] = create_surface(f13, trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f14 = get_surface_symmetry_points(f9, [1/2,1/2,1/2;1/2,0,1]);
% [x,y,z] = create_surface(f14, trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% 
% trans_mat = a/2*[-1,1,1;1,-1,1;1,1,-1];
% colormap hsv;


%% Face-centered cube
% % draw wigner
% title_l = 'FCC';
% alp = 1;
% p1 = [1/2,0,0];
% p2 = [1/4,1/4,1/4];
% p3 = [0,0,1/2];
% p4 = get_symmetry_point(p2,[1/2,0,0;0,0,1/2]);
% f1 = [p1;p2;p3;p4];
% [x,y,z,c] = create_surface(f1,trans_mat);
% cmap1 = ones(size(c))*0.8;
% cmap2 = ones(size(c))*0.4;
% cmap3 = ones(size(c))*-0.2;
% alpha(patch(x,y,z,cmap1),alp);
% f2 = get_surface_symmetry_points(f1,[1/2,-1/2,0;1,0,0]);
% [x,y,z] = create_surface(f2,trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% f3 = get_surface_symmetry_points(f2,[0,0,0;0,-1/2,0]);
% [x,y,z] = create_surface(f3,trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% f4 = get_surface_symmetry_points(f1,[0,0,0;1/2,0,0]);
% [x,y,z] = create_surface(f4,trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% 
% f5 = get_surface_symmetry_points(f1,[0,-1/4,1/4;0,0,1/2]);
% [x,y,z] = create_surface(f5,trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f6 = get_surface_symmetry_points(f5,[0,0,0;1,0,0]);
% [x,y,z] = create_surface(f6,trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f7 = get_surface_symmetry_points(f5,[0,0,0;0,1,0]);
% [x,y,z] = create_surface(f7,trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% f8 = get_surface_symmetry_points(f6,[0,0,0;0,1,0]);
% [x,y,z] = create_surface(f8,trans_mat);
% alpha(patch(x,y,z,cmap2),alp);
% 
% f9 = get_surface_symmetry_points(f1,[0,0,0;0,0,1]);
% [x,y,z] = create_surface(f9,trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% f10 = get_surface_symmetry_points(f2,[0,0,0;0,0,1]);
% [x,y,z] = create_surface(f10,trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% f11 = get_surface_symmetry_points(f3,[0,0,0;0,0,1]);
% [x,y,z] = create_surface(f11,trans_mat);
% alpha(patch(x,y,z,cmap3),alp);
% f12 = get_surface_symmetry_points(f4,[0,0,0;0,0,1]);
% [x,y,z] = create_surface(f12,trans_mat);
% alpha(patch(x,y,z,cmap1),alp);
% trans_mat = a/2*[0,1,1;1,0,1;1,1,0];
% colormap hsv;


%% Common Partion
% draw crystal system.
for atom=create_crystal_system(trans_mat,reshape(axis_limis,[2,3])')'
    [x,y,z,c] = create_atom(atom, ra);surf(x,y,z,sin(c));
%     % draw crystal face.
%     [x,y,z,c] = create_face([atom'/trans_mat;atom'/trans_mat+[1,0,0];...
%         atom'/trans_mat+[0,1,0]],trans_mat);alpha(surf(x,y,z,ones(size(c))),0.1);
end
title([title_l ' - WS'], 'color','k');
shading interp;


%% Animation
% for i=1:360
%     view(i,20);
%     drawnow;
%     M(i) = getframe(gcf);
% end
% im2gif(M, ['./gif/' lower(title_l) '_ws.gif'], 1/20);