clc;
close all; 
clear variables;
%%
sample_time = 1e-6; % sec
sim_duration = 0.1; % sec
delay = 0e-6; % sec
%%
% po, q, constant
mppt_algo_name = "po";
Irradiance = 1000; % W/m^2
Temperature = 25; % 'C
Voc = 21.9;
Isc = 1.84;
Vmppt = 17.6;
Imppt = 1.7;
duty_init = 0.4;
%%
Vout = 4; % V 
Vin = Vmppt; % V

fsw = 1e4; % Hz
Iout_max = Isc; % A
delta_IL = 0.2 * Iout_max; % A
delta_Vout = 0.01 * Vout; % V

L = Vout * (Vin - Vout) / (delta_IL * fsw * Vin); % H

Cout = delta_IL / (8 * fsw * delta_Vout); % F

Cin = 300e-6; % F

r_small = 1e-3; % Ohm

%%
sim_filename = 'buck_mppt';
open_system(sim_filename)
sim(sim_filename);

