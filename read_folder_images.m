function imageCell = read_folder_images(myFolder, pattern)
% I found this peace of code from net 
% https://in.mathworks.com/matlabcentral/answers/196072-how-to-read-all-the-images-in-a-folder#answer_173918
    if nargin < 2
        pattern = '*.jpg';
    end 
    if ~isdir(myFolder)
      errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
      uiwait(warndlg(errorMessage));
      return;
    end
    filePattern = fullfile(myFolder, pattern);
    jpegFiles = dir(filePattern);
    imageCell = {};
    for k = 1:length(jpegFiles)
      baseFileName = jpegFiles(k).name;
      fullFileName = fullfile(myFolder, baseFileName);
      imageArray = imread(fullFileName);
      imageCell{k} = {imageArray, baseFileName};
    end
end 