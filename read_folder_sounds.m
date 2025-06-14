function soundsCell = read_folder_sounds(myFolder)
    % myFolder = 'sources\sounds\letters';
    if ~isdir(myFolder)
      errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
      uiwait(warndlg(errorMessage));
      return;
    end
    filePattern = fullfile(myFolder, '*.wav');
    wavFiles = dir(filePattern);
    soundsCell = {};
    for k = 1:length(wavFiles)
      baseFileName = wavFiles(k).name;
      fullFileName = fullfile(myFolder, baseFileName);
      [soundArray fs] = audioread(fullFileName);
      soundsCell{k} = {soundArray, baseFileName};
    end
end 