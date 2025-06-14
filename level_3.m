function [levels_info, info] = level_3(win, constants,info,levels_info, pahandle)
   all_letters_sound = read_folder_sounds('sources\sounds\letters');
   if length(levels_info{3}.wrong_answers) == 0
        letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m',...
            'n','o','p','q','r','s','t','u','v','w','x','y','z'};
      letters_sound = all_letters_sound;
   else 
       letters_sound = {};
       i = 0;
       letters = levels_info{3}.wrong_answers;
       for l = letters
           for s =  all_letters_sound
               if strcmp( lower(s{1}{2}(1)), l{1})
                   i = i + 1;
                   letters_sound{i} = s{1};
               end
           end
       end
       
   end
   
   letters_order = [Shuffle(1:length(letters));Shuffle(1:length(letters));...
        Shuffle(1:length(letters));Shuffle(1:length(letters))];
   wrong_answers = {};
   j=0;
   for i = 1 : length(letters)
       status = listen_and_select(win, pahandle, constants,...
           letters_sound{letters_order(1,i)}{1}, letters(letters_order(2:4,i)),...
           letters{letters_order(1,i)}, 1, 100, 5);
       if status == -1 || status == 0
           j = j+1;
           wrong_answers{j} = letters{letters_order(1,i)};
       end
   end
   WaitSecs(1)
   levels_info{3}.wrong_answers = wrong_answers;
   levels_info{3}.score = 100*(1-(length(wrong_answers)/length(all_letters_sound)));
   levels_info{3}.score_hist = [levels_info{3}.score_hist, levels_info{3}.score];
   if levels_info{3}.score == 100
       levels_info{3}.status = 'completed';
       levels_info{3}.color = [0,255,0];
       info.current_level = 4;
   end
end