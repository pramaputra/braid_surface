Braid Surface generator produces a heatmap of a Fisher-Kolmogorov-Petrovsky-Piskunov 
model evolution of an undirected graph for human brain connectome data. 
This solver utilizes MATLAB built-in tools to solve differential equation such as ode45.
Currently supports for biomarker stageing and model selection purpose.

MATLAB Version Dependencies (R2015a or greater)
Tested with:
1. MATLAB R2015a
2. MATLAB R2020a

To run Braid Surface generator (main_fkpp.m or main_damage.m):
1. Make sure user puts all MATLAB scripts, brainregion.xlsx, and connectome_library folder
within the same directory.
2. Open main_fkpp.m to generate seed stageing braid surface and main_damage to generate
damage stageing braid surface.
3. Make sure user selects and inputs correct input data, i.e. csize for connectome size
selection, csource for type of connectome, cweight for weight selection.
4. Please be reminded that user needs to define TIME range that shows full Braak regions evolution 
process of the smallest dif or dam coefficient, which can be assessed through fkppplot or damageplot
function. Press Run or F5 (fn+F5) for a test run to see the evolution plot of the defined TIME range.
User will be asked whether to continue or terminate the process. Type 1 on the prompt to continue 
generating a braid surface, otherwise type 0. 
PS: User will not obtain correct stageing when full evolution process is not satisfied.
5. Particular to main_damage.m, user needs to choose between case-1 and case-2 within the script.
case-1 will give a braid surface of a fixed dam coefficient, while case-2 will give a braid surface of
a fixed dif coefficient.
6. Running time of the computation depends on size and weight of the selected connectome, defined TIME
range, and computer performance.

% ---------------------------------------------------
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
% ---------------------------------------------------