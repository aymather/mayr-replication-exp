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
        
        % Append each block to total trial sequence matrix
        trialseq = [trialseq; block];
        
        
    end
    
    % Place in trial numbers into your first column: id.trialNum
    for it = 1:trials
        trialseq(it, id.trialNum) = it;
    end
    
end