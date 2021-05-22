%  ---------------------------------------------------
%
% Oxford Mathematical Brain Modelling Group
%   Staging and model selection using braid surfaces for    
%   a Fisher-Kolmogorov-Petrovsky-Piskunov model
%
% Copyright (c) 2021 P. Putra, A. Goriely,
%  Mathematical Institute, Oxford University
%  Oxford, United Kingdom
%
%
%  Authors:
%                Putra, Prama                 - prama.putra@maths.ox.ac.uk
%                Alain Goriely                - goriely@maths.ox.ac.uk
%
% All rights reserved.
%
% Distribution
% This code is distributed under the GNU GPL V3 License
% https://www.gnu.org/licenses/gpl-3.0.html
%
% Copyright End
% -----------------------------------------------------------------

close all; clear all; clc;

%select connectome size
csize = [500 1015];
% csize = [250 463];
% csize = [125 234];
% csize = [60 129];
% csize = [33 83];

%select connectome source
% 1: 20-k streamlines HCP
% 2: 1-m streamlines HCP
csource = 1;

%select type of weight
% 1: diffusive weight (number of fibers per squared length of fibers)
% 2: ballistic weight (number of fibers per length of fibers)
% 3: length-free weight (length of fibers)
cweight = 1;

%case-1: define varying diffusion coefficient and fixed damage coefficient
% dif = exp([-5:0.1:0]);
% dam = exp(0);

%case-2: define varying diffusion coefficient and fixed damage coefficient
dif = exp(0);
dam = exp([-5:0.1:0]);

%define range of time of evolution
TIME = [0,1000];

%define Laplacian matrix and initial condition
[L,u0,n] = connectomelaplacian(csize,csource,cweight);

%case-1: damage plot of the smallest diffusion coefficient value
% damageplot(L,u0,n,TIMEdam,min(dif))
% drawnow;,

%case-2: damage plot of the smallest damage coefficient value
damageplot(L,u0,n,TIME,min(dam),dif)
drawnow;

prompt = 'Do you want to continue (Yes type 1/No type 0)? ';
x = input(prompt);
switch x
    case 0
        disp('done!')
        return
    case 1
        pause(0.01);
    otherwise
        disp('please re-run the program again!')
end

%case-1: compute braid surface of varying diffusion coefficient
% [braid_val,braid_ind,braid_conc] = damagebraidsurface_difvar(L,u0,n,TIME,dam,dif);

%case-2: compute braid surface of varying damage coefficient
[braid_val,braid_ind,braid_conc] = damagebraidsurface_damvar(L,u0,n,TIME,dam,dif);

%case-1: plot braid surface
% braidsurfaceplot(braid_ind,dif)

%case-2: plot braid surface
braidsurfaceplot2(braid_ind,dam)
