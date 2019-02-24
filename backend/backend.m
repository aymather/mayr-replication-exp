function trialseq = backend(trialseq, settings, id)


    % Shortnames
    trials = settings.trials.number_of_trials;
    blocks = settings.trials.number_of_blocks;
    numberOfColumns = length(fieldnames(id));
    ow = settings.screen.outwindow; % out window for drawing to screen
    owd = settings.screen.outwindowdims; % out window dimensions
    
    % Open welcome screen
    glo_welcome(ow);
    
    for it = 1:trials
        
        % Begin timer / set time tracker
        if it == 1; beginTime = GetSecs; end
        trialseq(it, id.time) = GetSecs - beginTime;
        
        % Draw fixation
        glo_fixation(ow, settings.durations.fixation);
        
        
        % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
        %                                                                   %
        %                               DO STUFF                            %
        %                                                                   %
        %  glo_drawArrow(ow, 'left', [center, center], arrow_size, color); 
        %                                                                   %
        % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
        
        
        % Save
        save(fullfile(settings.files.outfolder,settings.files.outfile),'trialseq','settings');
        
        % Block break / feedback
        if it == trials || trialseq(it,id.block) ~= trialseq(it+1,id.block)
            blockfeedback(settings, trialseq, it)
        end
        
        % Thank participant at end of experiment
        if it == trials; glo_outro(ow); end
        
    end
       
end