function data = get_data(name)

    % COLLECT DATA
%     disp(['Welcome to ' name '!']);
%     data.nr = input('Subject Number: ');
%     data.training = input('Training?: (0/1) ');
%     data.age = input('Age? ');
%     data.gender = input('Gender? (m/f) ','s');
%     data.hand = input('Handedness? (r/l) ','s');
%     data.eeg = input('EEG? (0/1): ');
%     data.topleft = input('Top Left: ', 's');
%     data.topright = input('Top Right: ', 's');
%     data.bottomright = input('Bottom Right: ', 's');
%     data.bottomleft = input('Bottom Left: ', 's');
    
    data.nr = 999;
    data.training = 0;
    data.age = 18;
    data.gender = 'm';
    data.hand = 'l';
    data.eeg = 0;
    data.topleft = '4';
    data.topright = '5';
    data.bottomright = '2';
    data.bottomleft = '1';
    
end