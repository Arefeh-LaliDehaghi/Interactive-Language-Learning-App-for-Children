function status = welcome_page(win, constants, magics)
   Screen('TextSize', win, 100);
   DrawFormattedText(win, 'Welcome', 'center', constants.screen_rec(4)/6,...
       [100, 200, 130]);
   Screen('TextSize', win, 50);
   DrawFormattedText(win, 'Psych cool english', 'center', constants.screen_rec(4)/6 + 100,...
       [40, 150, 150]);
   Screen('Flip', win, 0, 1);
   box_size = [250,100];
   page_rect = {[constants.screen_center - box_size/2, constants.screen_center + box_size/2];...
       round([constants.screen_center(1) - box_size(1)/2, 4*constants.screen_rec(4)/6 - box_size(2)/2,...
       constants.screen_center(1) + box_size(1)/2, 4*constants.screen_rec(4)/6 + box_size(2)/2]);
       [constants.screen_center(1)-75, 5*constants.screen_rec(4)/6-50,...
       constants.screen_center(1)+75, 5*constants.screen_rec(4)/6+50]};
   page_rect_tex ={'log in','sign in','close'};
   add_card_to_screen(win, constants, page_rect, page_rect_tex, 'rect', 25)
   switch select_rect(win, page_rect, 10000)
       case 1
           status = magics.LOG_IN;
       case 2
           status = magics.SIGN_IN;
       case 3
           status = magics.CLOSE;
   end
   Screen('Flip', win);
end