function [levels_info, info] = level_5(win, constants,info, levels_info, pahandle)
    symbol_size = [250 400];
    symbol_path = 'sources\images\symbols\listen3.jpg';
    paus_time = .7;
    listen_symbol = imread(symbol_path);
    
    tex=Screen('MakeTexture', win, listen_symbol);
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'Listen', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
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
    end
    WaitSecs(1)
    levels_info{5}.score = 100;
    levels_info{5}.status = 'completed';
    levels_info{5}.color = [0,255,0];
    info.current_level = 6;
end