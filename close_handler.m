function close_handler(info,  levels_info)
 if ~strcmp(info.name, 'null') 
    save(['sources\infos\',info.email,'.mat'], 'info', 'levels_info')
 end
end