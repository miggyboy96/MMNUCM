% Initialising global values

addpath(genpath('.')) % adds files in all subfolders to path

global beta gamma mu nu theta N0 tspan

beta = 2; % infection rate
gamma = 0.1; % recovery rate
mu = 0.01; % death rate
nu = 5; % vaccination rate
theta = 0.5; % reinfection rate


N0 = [100, 1, 0]; % initial [S I R] values
tspan = [0 30]; % desired span of time
