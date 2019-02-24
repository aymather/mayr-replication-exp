function settings = init(data, name)

    % SHELL SCRIPT NAME
    SHELL = [name '.m'];
    
    % TRIALS
    if data.training == 0
        % True experiment
        settings.trials.number_of_trials = 300; % 300 trials total | 50 trials per block
        settings.trials.number_of_blocks = 6; % 6 blocks total
    else
        % Training mode
        settings.trials.number_of_trials = 20;
        settings.trials.number_of_blocks = 1;
    end

    % LAYOUT
    settings.color.background = [0 0 0]; % black
    settings.color.font = [255 255 255]; % white
    
    % DURATIONS
    settings.durations.fixation = 1; % duration of trial start fixation
    settings.durations.iti = 1; % duration of inter-trial-interval
    
    % KEYBOARD / MOUSE
    HideCursor; ListenChar(2);
    KbName('UnifyKeyNames');

    % OPEN WINDOW
    screens = Screen('Screens');
    settings.screen.screenNumber = max(screens);
    [settings.screen.outwindow, settings.screen.outwindowdims] = Screen('OpenWindow', settings.screen.screenNumber, settings.color.background); % make screen, black bg
    Priority(MaxPriority(settings.screen.outwindow)); % prioritize

    % PREP FONTS
    Screen('TextFont',settings.screen.outwindow,'Arial'); % arial
    Screen('TextStyle', settings.screen.outwindow, 0); % make normal
    Screen('Preference', 'DefaultFontSize') % default

    % SOUND (UNCOMMENT IF YOU ARE USING SOUND)
    % settings.sound.srate = 44100;
    % settings.sound.duration = .2;
    % asamples = 0:1/settings.sound.srate:settings.sound.duration;
    % settings.sound.standardfreq = 600; % 600 hz
    % settings.sound.standardsound = sin(2* pi * settings.sound.standardfreq * asamples);
    % InitializePsychSound(1);
    % settings.sound.audiohandle = PsychPortAudio('Open', [], [], 0, settings.sound.srate, 1);
    % load(fullfile(fileparts(which(SHELL)), 'backend', 'extra', 'novelsounds.mat'));

    % SAVE INFO
    settings.files.infolder = fileparts(which(SHELL));
    settings.files.outfolder = fullfile(fileparts(which(SHELL)), 'out', filesep);
    clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
    settings.files.outfile = ['Subject_' num2str(data.nr) '_' date '_' hrs '.' mins 'h.mat'];
    
end