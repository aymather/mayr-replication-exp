function trialseq = trialseq(settings, id)

    % Short names
    trials = settings.trials.number_of_trials;
    blocks = settings.trials.number_of_blocks;
    numberOfColumns = length(fieldnames(id)); % number of columns in your trial sequence matrix
    trialsPerBlock = trials/blocks;
    
    % Init trialseq matrix
    trialseq = [];

    % Create trial sequence here:
    for ib = 1:blocks
        
        % Create each block here
        block = zeros(trialsPerBlock, numberOfColumns); % create a single block of trials1
        block(:,id.block) = ib;
        
        % Assign a bunch of random values (1:4) to trials
        block(:,id.loc) = randi([1 4], size(block,1), 1);
        
        % Assign random values to cues
        block(:,id.cue) = randi([1 3], size(block,1), 1);
        
        % Append each block to total trial sequence matrix
        trialseq = [trialseq; block];
        
    end
    
    % Get all the correct response locations
    for it = 1:trials
        if trialseq(it, id.loc) == 1 && trialseq(it, id.cue) == 1
            trialseq(it,id.c_resp) = 4;
        elseif trialseq(it, id.loc) == 1 && trialseq(it, id.cue) == 2
            trialseq(it,id.c_resp) = 2;
        elseif trialseq(it, id.loc) == 1 && trialseq(it, id.cue) == 3
            trialseq(it,id.c_resp) = 3;
        elseif trialseq(it, id.loc) == 2 && trialseq(it, id.cue) == 1
            trialseq(it,id.c_resp) = 3;
        elseif trialseq(it, id.loc) == 2 && trialseq(it, id.cue) == 2
            trialseq(it,id.c_resp) = 1;
        elseif trialseq(it, id.loc) == 2 && trialseq(it, id.cue) == 3
            trialseq(it,id.c_resp) = 4;
        elseif trialseq(it, id.loc) == 3 && trialseq(it, id.cue) == 1
            trialseq(it,id.c_resp) = 2;
        elseif trialseq(it, id.loc) == 3 && trialseq(it, id.cue) == 2
            trialseq(it,id.c_resp) = 4;
        elseif trialseq(it, id.loc) == 3 && trialseq(it, id.cue) == 3
            trialseq(it,id.c_resp) = 1;
        elseif trialseq(it, id.loc) == 4 && trialseq(it, id.cue) == 1
            trialseq(it,id.c_resp) = 1;
        elseif trialseq(it, id.loc) == 4 && trialseq(it, id.cue) == 2
            trialseq(it,id.c_resp) = 3;
        elseif trialseq(it, id.loc) == 4 && trialseq(it, id.cue) == 3
            trialseq(it,id.c_resp) = 2;
        end
    end
    
    % Place in trial numbers into your first column: id.trialNum
    for it = 1:trials
        trialseq(it, id.trialNum) = it;
    end
    
end