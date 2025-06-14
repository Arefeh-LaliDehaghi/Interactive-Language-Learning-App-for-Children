function  status=watching_and_typing(win, constants, images_file, correct_answer)
    symbol_size = [570 400];
    symbol_path = 'sources\images\symbols\listen_and_typing.png';
    symbol = imread(symbol_path);
    tex=Screen('MakeTexture', win, symbol);
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'watching and select', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    WaitSecs(1.5)
    
    DrawFormattedText(win, 'Watching the images and typing the name of what you see!\nPress enter when you typed!', 'center', constants.screen_rec(4)/6,...
        constants.TEXTS_COLOR);
    Screen('Flip', win,0,1);
    
    im_size = constants.screen_rec(4)/5;
    im_tex = Screen('MakeTexture', win, images_file);
    Screen('DrawTexture', win, im_tex, [], [constants.screen_center(1) - im_size/2,...
        constants.screen_rec(4)/4 , constants.screen_center(1) + im_size/2,...
        constants.screen_rec(4)/5 + im_size]);
   Screen('Flip', win,0,1);      
    
    user_input_answer = typing_handler(win, constants);
    Screen('Flip', win);
    user_answer_color = constants.TEXTS_COLOR;
    if strcmp(user_input_answer, correct_answer)
        result_symbol_im = imread('sources\images\symbols\correct.png');
        result_message = 'Good job:)';
        user_answer_color = [0, 255, 0];
        status = 1;
    elseif ~strcmp(user_input_answer, correct_answer)
        result_symbol_im = imread('sources\images\symbols\wrong_answer.png');
        result_message = 'dont worry, try more';
        user_answer_color = [255, 0, 0];
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
    Screen('TextSize', win, 50);
    DrawFormattedText(win, ['Correct answer: ',correct_answer] , 'center', 6*constants.screen_rec(4)/8,...
        constants.TEXTS_COLOR);
    DrawFormattedText(win, ['Your answer: ',user_input_answer] , 'center', 6*constants.screen_rec(4)/8 + 50,...
        user_answer_color);
    Screen('Flip', win);
    WaitSecs(2)
    
end