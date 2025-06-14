function rect_id = select_rect(win, rects, max_wait)
    rect_id = -1;
    s_time = GetSecs();
    select_flag = 0;
    while (GetSecs()-s_time) < max_wait && ~select_flag
    [mouse_x, mouse_y, buttons] = GetMouse(win); 
        if buttons(1)
            for i = 1 : length(rects)
                if mouse_x > rects{i}(1) &&...
                   mouse_x < rects{i}(3) &&...
                   mouse_y > rects{i}(2) &&...
                   mouse_y < rects{i}(4)
                     rect_id = i;
                     select_flag = 1;
                end
            end
        end
    end   
end