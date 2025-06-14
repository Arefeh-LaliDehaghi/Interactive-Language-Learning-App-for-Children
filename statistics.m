function state = statistics(win, constants, level_info , magics)
    fig = figure('visible', 'off');
    %set(fig, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    subplot(2,5,1)
    plot(level_info{3}.score_hist,'-or');
    title('level 3')
    grid on
    ylim([0,110]);
    subplot(2,5,2)
    plot(level_info{4}.score_hist,'-or');
    title('level 4')
    grid on
    ylim([0,110]);
    subplot(2,5,3)
    plot(level_info{7}.score_hist,'-or');
    title('level 7')
    grid on
    ylim([0,110]);
    subplot(2,5,4)
    plot(level_info{8}.score_hist,'-or');
    title('level 8')
    grid on
    ylim([0,110]);
    subplot(2,5,5)
    plot(level_info{9}.score_hist,'-or');
    title('level 9')
    grid on
    ylim([0,110]);
    subplot(2,5,6)
    plot(level_info{10}.score_hist,'-or');
    title('level 10')
    grid on
    ylim([0,110]);
    subplot(2,5,7)
    plot(level_info{11}.score_hist,'-or');
    title('level 11')
    grid on
    ylim([0,110]);
    subplot(2,5,8)
    plot(level_info{12}.score_hist,'-or');
    title('level 12')
    grid on
    ylim([0,110]);
    subplot(2,5,9)
    plot(level_info{13}.score_hist,'-or');
    title('level 13')
    grid on
    ylim([0,110]);
    subplot(2,5,10)
    plot(level_info{14}.score_hist,'-or');
    title('level 14')
    grid on
    ylim([0,110]);
    
    han=axes(fig,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    ylabel(han,'Score');
    xlabel(han,'Number of trying');
    %title(han,'yourTitle');
    
    saveas(fig,'sources/plot/plot.png')
    close(fig)
    
    
    Screen('TextSize', win, 60);
    DrawFormattedText(win, 'Your prformans in each level', 'center', constants.screen_rec(4)/9,...
       [100, 200, 130]);

   
   box_size = [constants.screen_rec(3)/9,constants.screen_rec(4)/13];
   page_rect = {[constants.screen_center(1)-box_size(1)/2,9*constants.screen_rec(4)/10,...
       constants.screen_center(1)+box_size(1)/2,9*constants.screen_rec(4)/10+box_size(2)/2]};
   page_rect_tex ={'back'};
   
   plot_path = 'sources\plot\plot.png';
   plot_im = imread(plot_path);
   plot_tex=Screen('MakeTexture', win, plot_im);
   Screen('DrawTexture', win, plot_tex, [],....
       [2*constants.screen_rec(3)/30,2*constants.screen_rec(4)/10,...
       28*constants.screen_rec(3)/30,8*constants.screen_rec(4)/10]);
   Screen('Flip', win,0,1)
   add_card_to_screen(win, constants, page_rect, page_rect_tex, 'rect', 25)
   switch select_rect(win, page_rect, 10000)
       case 1
           state = magics.BACK;
   end
   Screen('Flip', win)
end