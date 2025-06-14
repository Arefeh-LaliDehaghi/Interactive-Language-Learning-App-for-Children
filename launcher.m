%%
%   Arefeh Llai dehaghi matlab programing final project.
%   The project aim is teching writing and speking (also listenig is), for
%   run the code make sure you have this file structure:    
%   ../sources
%       |_______sounds
%                |______ letters   
%                |______ words  
%       |_______images
%                |______ symbols
%                |______ images
%                |______ cards 
%                |______ letters
%       |_______plot
%       |_______infos
%
%
%%%
%% constants and prepare the PSD environment
clear;
clc;
close all;
% magic values
magics.START = 7;
magics.STATISTICS = 6;
magics.NO_EXIST = 5;
magics.SIGN_IN = 4;
magics.LOG_IN = 3;
magics.BACK = 2;
magics.CLOSE = -1;
magics.COMPLET = 1;
% Constants 
constants.SMPLING_RATE = 48000; % quality of sound
constants.SCREEN_POSITION = [50, 50, 1220, 700];
constants.DISPLAY_COLOR = [255, 255, 255];
constants.TEXTS_COLOR = [0, 50, 150];
constants.TEXT_WRAPAT = 20; % maximun number of chracter can show in one line
constants.TEXT_SIZE = 25;
% user info
info.first_name = 'null';
info.last_name = 'null';
% set up environment
Screen('Preference', 'SkipSyncTests', 1);
[win, constants.screen_rec] = Screen('OpenWindow', 0, constants.DISPLAY_COLOR, constants.SCREEN_POSITION); 
%[win, constants.screen_rec] = Screen('OpenWindow', 0, constants.DISPLAY_COLOR); 
constants.screen_center = [constants.screen_rec(3)/2, constants.screen_rec(4)/2];
pahandle = PsychPortAudio('Open', [], [], [], constants.SMPLING_RATE,1);
%% Wclcomn and log in part
close_flag = 0;
log_in_flag = 0;
levels_info = 'null';
info.name = 'null';
while ~close_flag && ~log_in_flag
    wp_status = welcome_page(win, constants, magics);
    switch wp_status
      case magics.SIGN_IN 
        [status info] = sign_in_page(win, constants, magics);
        switch status
            case magics.SIGN_IN
                log_in_flag = 1;
                y_t_1 = 9*constants.screen_rec(4)/20;
                y_t_2 = 15*constants.screen_rec(4)/20;
                levels_info = generate_level_info_cell(constants, y_t_1, y_t_2);
                info.current_level = 1;
        end
      case magics.LOG_IN
        [status info levels_info] = log_in_page(win, constants, magics);
        switch status
            case magics.LOG_IN
                log_in_flag = 1;
            case magics.NO_EXIST
                not_exist_error_page(win, constants);
        end    
      case magics.CLOSE
          close_handler(info, levels_info)
          close_flag = 1;   
    end
end
while ~close_flag
    [status levels_info]= home_page(win, constants,info,levels_info,magics);
    switch status
        case magics.START
            switch info.current_level
                case 1
                    [levels_info, info] = level_1(win, constants,info,levels_info, pahandle);
                case 2
                    [levels_info, info] = level_2(win, constants,info,levels_info, pahandle); 
                case 3
                    [levels_info, info] = level_3(win, constants,info,levels_info, pahandle); 
                case 4
                    [levels_info, info] = level_4(win, constants,info,levels_info, pahandle); 
                case 5
                    [levels_info, info] = level_5(win, constants,info,levels_info, pahandle);
                case 6
                    [levels_info, info] = level_6(win, constants,info,levels_info, pahandle);
                case 7
                    [levels_info, info] = level_7(win, constants,info,levels_info, pahandle);
                case 8
                    [levels_info, info] = level_8(win, constants,info,levels_info, pahandle);
                case 9
                    [levels_info, info] = level_9(win, constants,info,levels_info, pahandle);
                case 10
                    [levels_info, info] = level_10(win, constants,info,levels_info, pahandle);
                case 11
                    [levels_info, info] = level_11(win, constants,info,levels_info, pahandle);
                case 12
                    [levels_info, info] = level_12(win, constants,info,levels_info, pahandle);
                case 13
                    [levels_info, info] = level_13(win, constants,info,levels_info, pahandle);
                case 14
                    [levels_info, info] = level_14(win, constants,info,levels_info, pahandle);
            end
        case magics.STATISTICS
            state_1 = statistics(win, constants, levels_info , magics); 
        case magics.CLOSE
            close_handler(info, levels_info)
            close_flag = 1;
    end
end
sca
