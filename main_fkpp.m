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

%define diffusion coefficient
dif = exp([-30:0.1:0]);

%define range of time of evolution
TIME = [0,100];

%define Laplacian matrix and initial condition
[L,u0,n] = connectomelaplacian(csize,csource,cweight);

%FKPP plot of the smallest diffusion coefficient value
fkppplot(L,u0,n,TIME,min(dif))
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

%compute braid surface of seeding
[braid_val,braid_ind,braid_conc] = fkppbraidsurface(L,u0,n,TIME,dif);

%plot braid surface
braidsurfaceplot(braid_ind,dif)
