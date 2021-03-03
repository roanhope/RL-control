clc;
close all;
clear variables;
%%
sample_time = 1e-5; % sec
sim_duration = 1; % sec
%%
Irradiance = 1000; % W/m^2
Temperature = 25; % 'C
%%
Vout = 6; % V
Vin = 17.6; % V
fsw = 1e4; % Hz
Iout_max = 1.84; % A
delta_IL = 0.2 * Iout_max; % A
delta_Vout = 0.01 * Vout; % V

L = Vout * (Vin - Vout) / (delta_IL * fsw * Vin); % H

Cout = delta_IL / (8 * fsw * delta_Vout); % F

Cin = 300e-6; % F

r_small = 1e-3; % Ohm
%%
sim_filename = 'buck_mppt';
% open_system(sim_filename)
sim(sim_filename);

