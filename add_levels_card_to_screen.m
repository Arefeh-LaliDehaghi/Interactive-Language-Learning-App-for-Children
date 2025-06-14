function add_levels_card_to_screen(win, constants, levels_info, test_size)
    cards_im = read_folder_images('sources\images\cards', 'owl_card*');
    Screen('TextSize', win, test_size);
    for i = 1 : length(levels_info)
        report = ['level: ', num2str(levels_info{i}.level), '\n',...
            'score: ', num2str(levels_info{i}.score), '/', num2str(levels_info{i}.max_score),'\n',...
            levels_info{i}.status];
        cards_im = Shuffle(cards_im);
        card_tex = Screen('MakeTexture', win, cards_im{1}{1});
        Screen('DrawTexture', win, card_tex, [], levels_info{i}.rect);
        DrawFormattedText(win, report,  'center', 'center',...
         levels_info{i}.color, [], [], [], [], [], levels_info{i}.rect)
    end
    Screen('Flip', win, 0, 1);
    Screen('TextSize', win, constants.TEXT_SIZE);
end