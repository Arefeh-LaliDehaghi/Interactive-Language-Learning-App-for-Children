function not_exist_error_page(win, constants)
    symbol_im = imread('sources\images\symbols\wrong_answer.png');
    message = 'Please sign in if you dont have any account\n if you already have an account, you have enter you email wrongly. pleas log in again\n(you will back to welcome page soon)';
    symbol_tex = Screen('MakeTexture', win, symbol_im);
    symbol_size = [150 150];
    Screen('DrawTexture', win, symbol_tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, message, 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, 60);
    Screen('Flip', win);
    WaitSecs(10)
end