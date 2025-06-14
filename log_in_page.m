function  [status info levels_info] = log_in_page(win, constants, magics)
    Screen('TextSize', win, 100);
   DrawFormattedText(win, 'Welcome', 'center', constants.screen_rec(4)/6,...
       constants.TEXTS_COLOR);
   Screen('TextSize', win, 35);
   DrawFormattedText(win, 'fill box and press enter to go next box,\n at the end select log in (or back)',...
       'center', constants.screen_rec(4)/6 + 100, constants.TEXTS_COLOR);
   b_h_c = 2*constants.screen_rec(3)/3;
   b_v_c = 5*constants.screen_rec(4)/12;
   b_s = 200;
   page_rect = {[b_h_c - b_s, b_v_c+75, b_h_c + b_s, b_v_c+125];
       [constants.screen_rec(3)/3-b_s/2, b_v_c+250,...
       constants.screen_rec(3)/3+b_s/2, b_v_c+300];
       [b_h_c - b_s/2, b_v_c+250, b_h_c + b_s/2, b_v_c+300]};
   for i = 1 : 1
       Screen('FrameRect', win, [0,0,0], page_rect{i})
   end
   DrawFormattedText(win, 'Email',...
       constants.screen_rec(3)/8, mean([page_rect{1}(2), page_rect{1}(4)]) );
   Screen('Flip', win, 0, 1);
   user_email = typing_handler(win, constants, page_rect{1},30);
   page_rect_tex ={'log in','back'};
   add_card_to_screen(win, constants, page_rect(end-1:end), page_rect_tex, 'rect', 25)
   infos_path = 'sources\infos\';
   switch select_rect(win, page_rect(end-1:end), 10000)
       case 1
           if exist(strcat(infos_path,user_email,'.mat'), 'file')            
              status = magics.LOG_IN;
              load(strcat(infos_path,user_email,'.mat'),'info','levels_info');
           else
              status = magics.NO_EXIST;
              info.name = 'null';
              levels_info = 'null';
           end
       case 2
           status = magics.BACK;
           info.name = 'null';
           levels_info = 'null';
   end
   Screen('Flip', win)
end