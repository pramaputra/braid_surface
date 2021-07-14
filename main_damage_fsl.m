%%  ---------------------------------------------------
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
%% -----------------------------------------------------------------
close all; clear all; clc;
% There are two cases in the script:
% case-1 : varying diffusion coefficient and fixed damage coefficient;
% case-2 : varying damage coefficient and fixed diffusion coefficient;
% The user needs to activate the correct functions of each case;
% For example, when the user wants to compute case-2, all functions of
% case-1 should be activated and all functions related to case-1 should be
% deactivated;

% -----------------------------------------------------------------
% Select connectome size
% -----------------------------------------------------------------
% Scale 500 has 1017 nodes;
% Scale 33 has 83 nodes;
% Activate csize by deleting % symbol or activate comment;
% Deactivate csize by typing % symbol or deactivate comment;
%
csize = [500 1017];
% csize = [33 83];
%
% -----------------------------------------------------------------
% Select connectome source
% -----------------------------------------------------------------
% The FSL connectomes of different thresholding methods are provided in the
% github. We use:
% DF    : Disparity Filtering; 
% DS    : Doubly Stochastic Disparity Filtering;
% HSS   : High-Salience Skeletonization;
% NAIVE : Naive Cutoff;
% NC    : Noise-Corrected Backboning;
% Example: type csource = 'DF'; cthreshold = 0.2; when using Disparity Filtering  
% threshold 0.2 connectome;
%
csource = 'DF';
cthreshold = 0.2;
%
% -----------------------------------------------------------------
% Select type of weight
% -----------------------------------------------------------------
% 1: diffusive weight (number of fibers per squared length of fibers);
% 2: ballistic weight (number of fibers per length of fibers);
% 3: length-free weight (length of fibers);
% Example: type cweight = 1 when using 20-k diffusive weighting scheme;
%
cweight = 1;
%
% -----------------------------------------------------------------
% Define diffusion coefficient
% -----------------------------------------------------------------
% dif is given as beta coefficient which is the ratio between diffusion and
% growth coefficients; dif can be defined as a range of very large numbers,
% however, the computation may take long running time;
% -------
% case-1: define varying diffusion coefficient and fixed damage coefficient;
% -------
%
% dif = exp([-10:0.1:0]); %acivate this when needed;
% dam = exp(0); %acivate this when needed;
%
% -------
% case-2: define varying damage coefficient and fixed diffusion coefficient;
% -------
%
dif = exp(0); %acivate this when needed;
dam = exp([-10:0.1:0]); %acivate this when needed;
%
% -----------------------------------------------------------------
% Define range of time of evolution
% -----------------------------------------------------------------
% TIME variable is given as a range of the initial and end time of
% evolution; If TIME is defined as [a,b], the step size will be determined
% automatically by MATLAB; User can define the step size and needs to wrtie
% the code as [a:h:b], where h is the step size;
%
TIME = [0,1000];
%
% -----------------------------------------------------------------
% Define Laplacian matrix and initial condition
% -----------------------------------------------------------------
% This function will generate the Laplacian matrix of a chosen connectome
% graph and automatically generate homogeneous initial condition at the entorhinal
% nodes with total initial concentration 5e-3, and zero elsewhere;
% INPUT  : csize, connectome size; csource, connectome source; cweight, connectome weight;
% OUTPUT : L, Laplacian matrix; u0, initial value vector; n, size of graph;
%
[L,u0,n] = connectomelaplacian_fsl(csize,csource,cthreshold,cweight);
% 
% -----------------------------------------------------------------
% Evolution plot of the smallest diffusion/damage coefficient value
% -----------------------------------------------------------------
% This function will produce a plot of Braak regions damage evolution; 
% User will need to define a new end time if the plot shows unfinished
% evolution process; The braid surface needs the full evolution process
% since it gives arrival time computation between 1% and 99% thresholds;
% The user needs to justify whether the smallest diffusion coefficient has
% given finished evolution process within the defined TIME range; 
% -------
% case-1: damage plot of the smallest diffusion coefficient value;
% -------
% INPUT  : L, Laplacian matrix; u0, initial value vector; n, size of graph; 
%          TIME, a range of time; dam, defined damage coefficient; 
%          min(dif), the minimum of defined dif;
% OUTPUT : Plot of Braak regions' damage evolution;
%
% damageplot(L,u0,n,TIME,dam,min(dif)) %acivate this when needed;
% drawnow; %acivate this when needed;
%
% -------
% case-2: damage plot of the smallest damage coefficient value;
% -------
% INPUT  : L, Laplacian matrix; u0, initial value vector; n, size of graph; 
%          TIME, a range of time; dif, defined dif coefficient; 
%          min(dam), the minimum of defined dam;
% OUTPUT : Plot of Braak regions' damage evolution;
%
damageplot(L,u0,n,TIME,min(dam),dif) %acivate this when needed;
drawnow; %acivate this when needed;
%
prompt = 'Do you want to continue (Yes type 1/No type 0)? ';
x = input(prompt); % Input of the prompt;
switch x
    case 0
        disp('done!') % The program will continue when the user types 1;
        return
    case 1
        pause(0.01);
    otherwise
        disp('please re-run the program again!') % The program will stop 
        % when the user types 0 and needs to re-define TIME variable and
        % re-run this program;
end
%
% -----------------------------------------------------------------
% Compute braid surface of damage
% -----------------------------------------------------------------
% Function to produce sequence of braids of a chosen connectome graph;
% -------
% case-1: compute braid surface of varying diffusion coefficient
% -------
% INPUT  : L, Laplacian matrix; u0, initial value vector; n, size of graph; 
%          TIME, a range of time; dam, defined dam coefficient; dif, defined dif range;
% OUTPUT : braid_conc, computed arrival time of Braak regions; braid_val:
% ordered computed arrival time of Braak regions; braid_ind, ordered
% indexes of Braak regions;
%
% [braid_val,braid_ind,braid_conc] = damagebraidsurface_difvar(L,u0,n,TIME,dam,dif); %acivate this when needed;
% 
% -------
% case-2: compute braid surface of varying damage coefficient
% -------
% INPUT  : L, Laplacian matrix; u0, initial value vector; n, size of graph; 
%          TIME, a range of time; dam, defined dam coefficient; dif, defined dif range;
% OUTPUT : braid_conc, computed arrival time of Braak regions; braid_val:
% ordered computed arrival time of Braak regions; braid_ind, ordered
% indexes of Braak regions;
%
[braid_val,braid_ind,braid_conc] = damagebraidsurface_damvar(L,u0,n,TIME,dam,dif); %acivate this when needed;
%
% -----------------------------------------------------------------
% Plot braid surface
% -----------------------------------------------------------------
% Function to produce the braid surface plot of a chosen connectome graph;
% -------
% case-1: plot braid surface
% -------
% INPUT  : braid_ind, ordered indexes of Braak regions; dif, defined dif range;
% OUTPUT : Plot of braid surface;
%
% braidsurfaceplot(braid_ind,dif) %acivate this when needed;
%
% -------
% case-2: plot braid surface
% -------
% INPUT  : braid_ind, ordered indexes of Braak regions; dam, defined dam range;
% OUTPUT : Plot of braid surface;
%
braidsurfaceplot2(braid_ind,dam) %acivate this when needed;
%