function [levels_info, info] = level_2(win, constants,info,levels_info, pahandle)
   all_letters = {'A, a','B, b','C, c','D, d','E, e','F, f','G, g',...
        'H, h','I, i','J, j','K, k','L, l','M, m',...
        'N, n','O, o','P, p','Q, q','R, r','S, s',...
        'T, t','U, u','V, v','W, w','X, x','Y, y','Z, z'};
   letters_sound_info = read_folder_sounds('sources\sounds\letters');
   letters_sound = {};
   i = 0;
   for w = letters_sound_info
       i = i+1;
       letters_sound{i}= w{1}{1};
   end
   listen_and_repeat(win, pahandle, constants, all_letters, letters_sound, 2)
   WaitSecs(1)
   levels_info{2}.score = 100;
   levels_info{2}.status = 'completed';
   levels_info{2}.color = [0,255,0];
   info.current_level = 3;
   
end