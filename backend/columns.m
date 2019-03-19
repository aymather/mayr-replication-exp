function id = columns

    % Create column names for your trial sequence matrix here
    id.trialNum = 1; % trial number
    id.block = 2; % block number
    id.time = 3; % time tracker
    id.loc = 4;  % original dot location {4: topleft, 5: topright, 2: bottomright, 1: bottomleft}
    id.type = 5; % trial type {1: vertical, 2: horizontal, 3: diagonal}
    id.resp = 6; % response location {4: topleft, 5: topright, 2: bottomright, 1: bottomleft}
    id.rt = 7;
    
end