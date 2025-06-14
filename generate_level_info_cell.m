function level_info = generate_level_info_cell(constants, y_t_1, y_t_2)
    level_info = cell(14,1);
    card_size = [(3*(constants.screen_rec(3)/8)/4), constants.screen_rec(4)/5];
    for i = 1 : length(level_info)
        level_info{i} = struct;
        level_info{i}.level = i;
        level_info{i}.score = 0;
        level_info{i}.status = 'not complete';
        level_info{i}.color = [0,0,0];
        level_info{i}.name = 'null';
        level_info{i}.max_score = 100;
        level_info{i}.wrong_answers = [];
        level_info{i}.score_hist = [];
    end 
    for i = 1 : 7
        up_left = [ i*(constants.screen_rec(3)/8)-card_size(1)/2,...
            y_t_1 - card_size(2)-constants.screen_rec(4)/17];
        level_info{i}.rect = [up_left, up_left+card_size];
    end
    for j = 8 : 14
        i = j - 7;
        up_left = [i*(constants.screen_rec(3)/8)-card_size(1)/2,...
            y_t_2 - card_size(2)-constants.screen_rec(4)/17];
        level_info{j}.rect = [up_left, up_left+card_size];
    end
    
end