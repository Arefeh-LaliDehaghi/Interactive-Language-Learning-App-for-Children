function [levels_info, info] = level_6(win, constants,info, levels_info, pahandle)
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
    
    words_sound = read_folder_sounds('sources\sounds\words');
    words_image = read_folder_images('sources\images\images');
    Screen('TextSize', win, 50);
    
    im_size = constants.screen_rec(4)/3;
    for i = 1 : length(words_image)
        im_tex = Screen('MakeTexture', win, words_image{i}{1});
        Screen('DrawTexture', win, im_tex, [], [constants.screen_center(1) - im_size/2,...
            constants.screen_center(2) - im_size/2, constants.screen_center(1) + im_size/2,...
            constants.screen_center(2) + im_size/2]);
        DrawFormattedText(win, words_image{i}{2}(1:end-4), 'center', 4* constants.screen_rec(4)/5,...
            constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        PsychPortAudio('FillBuffer', pahandle, words_sound{i}{1}');
        Screen('Flip', win)
        PsychPortAudio('Start', pahandle);        
        WaitSecs(3)
        
        DrawFormattedText(win, 'Again!', 'center', constants.screen_rec(4)/5,...
            constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        Screen('DrawTexture', win, im_tex, [], [constants.screen_center(1) - im_size/2,...
            constants.screen_center(2) - im_size/2, constants.screen_center(1) + im_size/2,...
            constants.screen_center(2) + im_size/2]);
        DrawFormattedText(win, words_image{i}{2}(1:end-4), 'center', 4* constants.screen_rec(4)/5,...
            constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        PsychPortAudio('FillBuffer', pahandle, words_sound{i}{1}');
        Screen('Flip', win)
        PsychPortAudio('Start', pahandle);        
        WaitSecs(2)
    end
    
    levels_info{6}.score = 100;
    levels_info{6}.status = 'completed';
    levels_info{6}.color = [0,255,0];
    info.current_level = 7;
end

