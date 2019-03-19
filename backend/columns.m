function id = columns

    % Create column names for your trial sequence matrix here
    id.trialNum = 1;     % trial number
    id.block = 2;        % block number
    id.time = 3;         % time tracker
    id.loc = 4;          % original dot location {1: topleft, 2: topright, 3: bottomright, 4: bottomleft}
    id.cue = 5;          % trial type {1: vertical, 2: horizontal, 3: diagonal}
    id.c_resp = 6;       % location of the correct response location {1: topleft, 2: topright, 3: bottomright, 4: bottomleft}
    id.resp = 7;         % response location {1: topleft, 2: topright, 3: bottomright, 4: bottomleft}
    id.rt = 8;           % reaction time
    id.acc = 9;          % accuracy code
    
end