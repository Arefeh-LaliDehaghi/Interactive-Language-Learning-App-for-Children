function  [status levels_info] = home_page(win, constants, info, levels_info , magics)
   Screen('TextSize', win, 60);
   DrawFormattedText(win, 'Home', 'center', constants.screen_rec(4)/9,...
       [100, 200, 130]);
   Screen('TextSize', win, 30);
   DrawFormattedText(win, ['Hi ', info.name], 'center', constants.screen_rec(4)/9 + 30,...
       [40, 150, 150]);
   
   box_size = [constants.screen_rec(3)/9,constants.screen_rec(4)/13];
   page_rect = {[[50,50], box_size+50];
       [constants.screen_rec(3)-50-box_size(1),50,constants.screen_rec(3)-50, box_size(2)+50];
       [constants.screen_center(1)-box_size(1)/2,7*constants.screen_rec(4)/8-box_size(2)/2,...
       constants.screen_center(1)+box_size(1)/2,7*constants.screen_rec(4)/8+box_size(2)/2]};
   page_rect_tex ={'colse','statistics','start'};
   y_t_1 = 9*constants.screen_rec(4)/20;
   y_t_2 = 15*constants.screen_rec(4)/20;
   
   
   add_card_to_screen(win, constants, page_rect, page_rect_tex, 'rect', 25)
   add_levels_card_to_screen(win, constants, levels_info, 15)
   
   trak_path = 'sources\images\symbols\long_track.png';
   track = imread(trak_path);
   track_tex=Screen('MakeTexture', win, track);
   Screen('DrawTexture', win, track_tex, [],....
       [0,9*constants.screen_rec(4)/20,constants.screen_rec(3),9*constants.screen_rec(4)/20+30]);
   Screen('DrawTexture', win, track_tex, [],....
       [0,15*constants.screen_rec(4)/20,constants.screen_rec(3),15*constants.screen_rec(4)/20+30]);
   train_size = [constants.screen_rec(3)/7,constants.screen_rec(4)/15];
   train_path = 'sources\images\symbols\train.png';
   train_im = imread(train_path);
   train_tex=Screen('MakeTexture', win, train_im);
   if info.current_level < 8
       Screen('DrawTexture', win, train_tex, [],....
       [(info.current_level)*constants.screen_rec(3)/8-train_size(1)/2,y_t_1-train_size(2),...
       (info.current_level)*constants.screen_rec(3)/8+train_size(1)/2,y_t_1]);
   else
       Screen('DrawTexture', win, train_tex, [],....
       [(info.current_level-7)*constants.screen_rec(3)/8-train_size(1)/2,y_t_2-train_size(2),...
       (info.current_level-7)*constants.screen_rec(3)/8+train_size(1)/2,y_t_2]);
   end
   Screen('Flip', win, 0, 1);
   
   add_card_to_screen(win, constants, page_rect, page_rect_tex, 'rect', 25)
   switch select_rect(win, page_rect, 10000)
       case 1
           status = magics.CLOSE;
       case 2
           status = magics.STATISTICS;
       case 3
           status = magics.START;
   end
   Screen('Flip', win)
   %WaitSecs(15)
end