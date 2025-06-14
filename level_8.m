function [levels_info, info] = level_8(win, constants,info,levels_info, pahandle)
   all_words_images = read_folder_images('sources\images\images');
   if length(levels_info{8}.wrong_answers) == 0
       words = {};
       words_images = {};
        for i = 1 : round(length(all_words_images)/2)
            words{i} = all_words_images{i}{2}(1:end-4);
            words_images{i} = all_words_images{i};
        end
   else 
       words_images = {};
       i = 0;
       words = levels_info{8}.wrong_answers;
       for w = words
           for s =  all_words_images
               if strcmp(s{1}{2}(1:end-4), w{1})
                   i = i + 1;
                   words_images{i} = s{1};
               end
           end
       end
       
   end
   
   words_order = [Shuffle(1:length(words));Shuffle(1:length(words));...
        Shuffle(1:length(words));Shuffle(1:length(words))];
   wrong_answers = {};
   j=0;
   for i = 1 : length(words)
       status = watching_and_select(win, constants,...
           words_images{words_order(1,i)}{1}, words(words_order(2:4,i)),...
           words{words_order(1,i)},2.5, 30, 5);
       if status == -1 || status == 0
           j = j+1;
           wrong_answers{j} = words{words_order(1,i)};
       end
   end
   WaitSecs(1)
   levels_info{8}.wrong_answers = wrong_answers;
   levels_info{8}.score = 100*(1-(length(wrong_answers)/round(length(all_words_images)/2)));
   levels_info{8}.score_hist = [levels_info{8}.score_hist, levels_info{8}.score];
   if levels_info{8}.score == 100
       levels_info{8}.status = 'completed';
       levels_info{8}.color = [0,255,0];
       info.current_level = 9;
   end
end