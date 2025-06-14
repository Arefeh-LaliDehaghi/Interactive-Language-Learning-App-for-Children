function out_put = show_and_read_all_letters(win, pahandle, constants)
% fist step in learning letters, show and read
%   all letter will show and read
    symbol_size = [250 400];
    symbol_path = 'sources\images\symbols\listen3.jpg';
    paus_time = .7;
    listen_symbol = imread(symbol_path);
    letters_sound = read_folder_sounds('sources\sounds\letters');

    tex=Screen('MakeTexture', win, listen_symbol);
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'Listen', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    Screen('TextSize', win, 200);
    WaitSecs(3)
    for i = 1 : length(letters_sound)
        curent_letter = letters_sound{i}{2};
        curent_letter = curent_letter(1);
        DrawFormattedText(win, [curent_letter, ', ', lower(curent_letter)], 'center', 'center',...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        PsychPortAudio('FillBuffer', pahandle, letters_sound{i}{1}');
        PsychPortAudio('Start', pahandle);
        Screen('Flip', win);
        WaitSecs(paus_time)
    end 
    
    Screen('DrawTexture', win, tex, [],....
        [constants.screen_rec(3)/2 - symbol_size(1)/2, constants.screen_rec(4)/2 - symbol_size(2)*2/3,...
        constants.screen_rec(3)/2 + symbol_size(1)/2, constants.screen_rec(4)/2 + symbol_size(2)/3]);
    Screen('TextSize', win, 30);
    DrawFormattedText(win, 'Listen again!', 'center', constants.screen_rec(4)/2 + symbol_size(2)/3 + 40,...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
    Screen('Flip', win);
    Screen('TextSize', win, 60);
    WaitSecs(3)
    letter_text = [];
    for i = 1 : length(letters_sound)
        curent_letter = letters_sound{i}{2};
        curent_letter = curent_letter(1);
        if curent_letter ~= 'Z'
            letter_text = [letter_text, curent_letter, '(', lower(curent_letter), ')', ', '];
        else
            letter_text = [letter_text, curent_letter, '(', lower(curent_letter), ')'];
        end
        DrawFormattedText(win, letter_text, 'center', 'center',...
        constants.TEXTS_COLOR, constants.TEXT_WRAPAT);
        PsychPortAudio('FillBuffer', pahandle, letters_sound{i}{1}');
        PsychPortAudio('Start', pahandle);
        Screen('Flip', win);
        WaitSecs(paus_time/2)
    end 
    WaitSecs(7)
    out_put = 'complite';
end

