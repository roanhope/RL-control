clc;
close all;
clear variables;
%%
sim_filename = 'control';
% sim_filename = 'panels';

open_system(sim_filename)
%%
sim_duration = 10;
time_step = 1e-2;
%%
mppt_algo_name = "po";
duty_init = 0.5;

Isc = 1.84;
Voc_per_cell = 0.6;
num_cells_series = 36;
Voc = num_cells_series * Voc_per_cell;

%%
sim(sim_filename);

