function [levels_info, info] = level_11(win, constants,info,levels_info, pahandle)
   all_words_sound = read_folder_sounds('sources\sounds\words');
   idx = round(length(all_words_sound)/2)+1 : length(all_words_sound);
   c = round(length(all_words_sound)/2);
   if length(levels_info{11}.wrong_answers) == 0
       words = {};
       words_sound = {};
        for i = idx
            words{i-c} = all_words_sound{i}{2}(1:end-4);
            words_sound{i-c} = all_words_sound{i};
        end
   else 
       words_sound = {};
       i = 0;
       words = levels_info{11}.wrong_answers;
       for w = words
           for s =  all_words_sound
               if strcmp(s{1}{2}(1:end-4), w{1})
                   i = i + 1;
                   words_sound{i} = s{1};
               end
           end
       end
       
   end
   
   words_order = [Shuffle(1:length(words));Shuffle(1:length(words));...
        Shuffle(1:length(words));Shuffle(1:length(words))];
   wrong_answers = {};
   j=0;
   for i = 1 : length(words)
       status = listen_and_select(win, pahandle, constants,...
           words_sound{words_order(1,i)}{1}, words(words_order(2:4,i)),...
           words{words_order(1,i)}, 1, 30,   5);
       if status == -1 || status == 0
           j = j+1;
           wrong_answers{j} = words{words_order(1,i)};
       end
   end
   WaitSecs(1)
   levels_info{11}.wrong_answers = wrong_answers;
   levels_info{11}.score = 100*(1-(length(wrong_answers)/round(length(all_words_sound)/2)));
   levels_info{11}.score_hist = [levels_info{11}.score_hist, levels_info{11}.score];
   if levels_info{11}.score == 100
       levels_info{11}.status = 'completed';
       levels_info{11}.color = [0,255,0];
       info.current_level = 12;
   end
end