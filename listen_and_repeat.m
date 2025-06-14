function listen_and_repeat(win, pahandle, constants, str_cell, aoudio_cell, paus_time, order_type_flag)
    if nargin < 7
        order_type_flag = 0;
    end 

    if order_type_flag == 1
        [str_cell, shuffled_idx] = Shuffle(str_cell);
        aoudio_cell = aoudio_cell(shuffled_idx);
    end
    
    symbol_size = [500 300];
    symbol_path = 'sources\images\symbols\listen_and_repeat.png';
    symbol = imread(symbol_path);

    tex=Screen('MakeTexture', win, symbol);
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'Listen and repeat', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    Screen('TextSize', win, 200);
    WaitSecs(3)
    for i = 1 : length(aoudio_cell)
        DrawFormattedText(win, str_cell{i} , 'center', 'center',...
            constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        PsychPortAudio('FillBuffer', pahandle, aoudio_cell{i}');
        PsychPortAudio('Start', pahandle);
        Screen('Flip', win);
        WaitSecs(paus_time)
    end
end 