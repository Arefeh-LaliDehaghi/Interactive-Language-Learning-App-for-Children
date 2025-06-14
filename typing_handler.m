function user_input_string = typing_handler(win, constants, poss_rect, text_size)
    if nargin < 3
        poss_rect = [constants.screen_center(1)-300, constants.screen_center(2)-35,...
            constants.screen_center(1)+300,constants.screen_center(2)+30];
        text_size = constants.TEXT_SIZE;
        white_rect_size = [0, constants.screen_rec(4)];
    elseif nargin < 4
        text_size = constants.TEXT_SIZE;
        white_rect_size = [0, constants.screen_rec(4)];
    end
    white_rect = [poss_rect(1)+5,poss_rect(2)+5,poss_rect(3)-5,poss_rect(4)-5];
    Screen('TextSize', win, text_size)
    KbName('UnifyKeyNames')
    user_input_string = [];
    FlushEvents('keyDown')
    while true
         [chars] = GetChar(1);
         if sum(double(chars) == 13) > 0 % return(enter) char double code is 13
            break
         end
         if sum(double(chars) == 8) > 0 % return(enter) char double code is 13
            user_input_string = user_input_string(1:end-1);
         else
            user_input_string = [user_input_string, chars];
         end
         Screen('FillRect', win, [255, 255, 255], white_rect);
         DrawFormattedText(win, user_input_string,'center', 'center',...
         constants.TEXTS_COLOR, [], [], [], [], [], white_rect)
         Screen('Flip', win,0,1)
    end
    FlushEvents('keyDown')
    Screen('TextSize', win, constants.TEXT_SIZE)
    %Screen('Flip', win)
end

