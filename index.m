% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 
%   Project Manager: Ben Rangel
%   Developer: Alec Mather
%   Date: 3.19.19
%   Email:
%   Supervisor: Jan Wessel
%   University: University of Iowa
%   Matlab version: 2017b
%   Description: 
%   Other technologies used: PsychToolBox
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% Clear workspace
clear;clc;
commandwindow;
PsychPortAudio('Close');

% MacOS Specific
% Uncomment the following line if you are testing on a mac, otherwise
% do not use this line when actually using your experiment.

Screen('Preference', 'SkipSyncTests', 1);

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
trialseq = backend(trialseq, settings, id, data);

% Save
save(fullfile(settings.files.outfolder, settings.files.outfile), 'trialseq', 'settings', 'data', 'id');

% Finished :)
% Template created by: Alec Mather https://github.com/aymather