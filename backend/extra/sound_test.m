function sound_test(hz)

    stimduration = .2;
    srate = 16000;
    duration = .2;
    InitializePsychSound(1);
    asamples = 0:1/srate:duration;
    wavdata = sin(2 * pi * hz * asamples);
    audiohandle = PsychPortAudio('Open',[],[],0,srate,1);
    PsychPortAudio('FillBuffer',audiohandle,wavdata);
    stimstart = PsychPortAudio('Start',audiohandle,1,0,1);
    while GetSecs - stimstart <= stimduration
        WaitSecs(0.001);
    end
    PsychPortAudio('Stop',audiohandle,1);
    PsychPortAudio('Close');

end