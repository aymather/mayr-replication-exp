% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 
%   Name: 
%   Date:
%   Email:
%   Supervisor:
%   University:
%   Matlab version:
%   Description:
%   Other technologies used:
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% Clear workspace
clear;clc;
commandwindow;
PsychPortAudio('Close');

% MacOS Specific
% Uncomment the following line if you are testing on a mac, otherwise
% do not use this line when actually using your experiment.

% Screen('Preference', 'SkipSyncTests', 1);

% Enter the name of your project here to get started.
% If you change this, you must also change the name of this shell script
PROJECT_NAME = 'index';

% Generate a path to your project name
addpath(genpath(fileparts(which([PROJECT_NAME '.m']))));

% Get data form
data = get_data(PROJECT_NAME);

% Init settings
settings = init(data, PROJECT_NAME);

% Get trial sequence column numbers/names
id = columns;

% Create trial sequence
trialseq = trialseq(settings, id);

% Enter experiment:
trialseq = backend(trialseq, settings, id);