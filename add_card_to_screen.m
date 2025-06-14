function add_card_to_screen(win, constants, cards_rect, card_str, card_type, test_size)
    if strcmp(card_type, 'square')
        cards_im = read_folder_images('sources\images\cards', 'square_card*');
    elseif strcmp(card_type, 'rect')
        cards_im = read_folder_images('sources\images\cards', 'rect_card*');
    elseif strcmp(card_type, 'Owl')
        cards_im = read_folder_images('sources\images\cards', 'owl_card*');
    end
    Screen('TextSize', win, test_size);
    for i = 1 : length(card_str)
        cards_im = Shuffle(cards_im);
        card_tex = Screen('MakeTexture', win, cards_im{1}{1});
        Screen('DrawTexture', win, card_tex, [], cards_rect{i});
        DrawFormattedText(win, card_str{i},  'center', 'center',...
         constants.TEXTS_COLOR, constants.TEXT_WRAPAT, [], [], [], [], cards_rect{i})
    end
    Screen('Flip', win, 0, 1);
    Screen('TextSize', win, constants.TEXT_SIZE);
end