function status = listen_and_select(win, pahandle, constants, audio_file, possible_answers,...
    corecct_answer, liste_period, text_size, select_period)
    
    symbol_size = [250 400];
    symbol_path = 'sources\images\symbols\listen3.jpg';
    symbol = imread(symbol_path);
    tex=Screen('MakeTexture', win, symbol);
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'Listen and select!', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    WaitSecs(2)
    
    PsychPortAudio('FillBuffer', pahandle, audio_file');
    PsychPortAudio('start', pahandle)
    WaitSecs(liste_period);
    PsychPortAudio('start', pahandle)
    WaitSecs(liste_period);
    
    card_size = [200, 200];
    card_margin = 50;
    card_offset = card_size + card_margin;
    cards_str = Shuffle({possible_answers{randperm(length(possible_answers),3)}, corecct_answer});
    cards_poss = {constants.screen_center + [-1*card_offset(1), -1*card_offset(2)];
        constants.screen_center + [card_margin, -1*card_offset(2)];
        constants.screen_center + [-1*card_offset(1), card_margin];
        constants.screen_center + [card_margin, card_margin]};
    correct_card_id = find(strcmp(cards_str,corecct_answer));
    rects = cell(4,1);
    for i = 1 : 4
        rects{i} = [cards_poss{i}, cards_poss{i} + card_size];
    end 
    add_card_to_screen(win, constants, rects, cards_str, 'square', text_size)
    selected_card_id = select_rect(win, rects, select_period);
    Screen('Flip', win);
    if selected_card_id == -1
        result_symbol_im = imread('sources\images\symbols\time_end.png');
        result_message = 'Oops!, try faster';
        status = 0;
    elseif sum(selected_card_id == correct_card_id) > 0
        result_symbol_im = imread('sources\images\symbols\correct.png');
        result_message = 'Good job:)';
        status = 1;
    elseif sum(selected_card_id == correct_card_id) == 0
        result_symbol_im = imread('sources\images\symbols\wrong_answer.png');
        result_message = 'dont worry, try more';
        status = -1;
    end
    result_symbol_tex = Screen('MakeTexture', win, result_symbol_im);
    symbol_size = [150 150];
    Screen('DrawTexture', win, result_symbol_tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, result_message, 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    WaitSecs(2)
end