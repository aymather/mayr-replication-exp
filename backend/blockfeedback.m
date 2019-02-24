function blockfeedback(settings, trialseq, id, it)

    % Shortnames
    ow = settings.screen.outwindow;
    owd = settings.screen.outwindowdims;
    currentBlockNum = trialseq(it, id.block);
    blocks = settings.trials.number_of_blocks;
    trials = settings.trials.number_of_trials;

    % Select trials from completed block
    blocktrials = trialseq(trialseq(:, id.block) == currentBlockNum,:);
    
    % % % % % % % % % % % % % % % % % % % % % %
    % COLLECT STATS FROM PREVIOUS BLOCK HERE  %
    % % % % % % % % % % % % % % % % % % % % % %

    % Draw stats to screen
    DrawFormattedText(ow, ['Block: ' num2str(currentBlockNum) '/' num2str(blocks)], 'center', 'center');
    
    % Flip to outwindow
    Screen('Flip', ow);
    WaitSecs(1); KbWait(-1);
    
    % Play a countdown into next block
    if it < trials
        glo_countdown(ow);
    end

end