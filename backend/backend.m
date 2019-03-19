function trialseq = backend(trialseq, settings, id)

    % Shortnames
    trials = settings.trials.number_of_trials;
    blocks = settings.trials.number_of_blocks;
    numberOfColumns = length(fieldnames(id));
    ow = settings.screen.outwindow; % out window for drawing to screen
    owd = settings.screen.outwindowdims; % out window dimensions
    
    % Open welcome screen
    glo_welcome(ow,'Press Any Key To Begin!',[0 0 0]);
    
    for it = 1:trials
        
        % Begin timer / set time tracker
        if it == 1; beginTime = GetSecs; end
        trialseq(it, id.time) = GetSecs - beginTime;
        
        % Draw Box
        DrawHollowSquare(settings, settings.loc.box, settings.size.box);
        DrawFormattedText(ow, settings.cues{trialseq(it,id.cue)},'center',owd(4)/9,settings.color.font);
        Screen('Flip',ow);
        WaitSecs(settings.durations.offset);
        
        % Draw Box with dot
        DrawHollowSquare(settings,settings.loc.box,settings.size.box);
        DrawFormattedText(ow, settings.cues{trialseq(it,id.cue)},'center',owd(4)/9,settings.color.font);
        Screen('DrawDots', ow, ...
            settings.loc.circle{trialseq(it,id.loc)}, ...
            settings.size.dotradius, ...
            settings.color.dot, ...
            [], 1);
        starttime = Screen('Flip',ow);
        
        % Wait for response
        while GetSecs - starttime <= settings.durations.response
            [~,~,keycode] = KbCheck(-1);
            if ismember(KbName(keycode),settings.keys)
                trialseq(it,id.rt) = GetSecs - starttime;
                trialseq(it,id.resp) = strfind(settings.keys,KbName(keycode));
                break
            end
            WaitSecs(0.001); % prevent overload
        end
        
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