clear all, close all, clc

%% FORMULA variables

% Transmitting coil
I = 10; % filament current [A]
turns = 10; % Numer of turn in the coil []
radius = 10; % Radius of transmitting coil [m]

% Receiving coil
turns_car = 10; % Numer of turn in the coil []
radius_car = 10; % Radius of transmitting coil [m]

% Coil orientation
height = 2; % Height of the receiving coil above the transmitting coil [m]
spacing = 30; % distance betewen centers of [m]
velocity = 1; % velocity of car [m/s]

%% Cost Analysis Variables

rho_car = 10; % resistivity of the wire [?] ?????
L_car = 10000; % Length of the wire in the car [m]
A_car = .001; % Cross sectional area of the wire in the car [m^2]
rho = 10; % resistivity of the wire [?]
V = 1; % voltage of power source [V]
V_car = 12; % voltage of car battery [V]
%gauge in road
%gauge in car

%% MAIN

totalScenarios = 1;
data = zeros(totalScenarios, 12);
format shortG

for i = 1:totalScenarios
    scenarioID = i;
    totalCharge = DWPTz(I, turns, radius, turns_car, radius_car, height, spacing, velocity, rho_car, L_car, A_car, scenarioID);
    data(i,:) = [I turns radius turns_car radius_car height spacing velocity rho_car L_car A_car totalCharge];
end

writematrix(data,'data.csv')