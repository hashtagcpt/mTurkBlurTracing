fid = fopen('blurTracing_munged_1.txt');
C = textscan(fid, '%s','Delimiter',',');
fclose(fid);
 
 % assign data file contents to a str
 dataStr = C{1};
 
 % filenames
 fileNameStr = {'1E.jpg', '2E.jpg', '3E.jpg', '4E.jpg', '5E.jpg', '6E.jpg', '7E.jpg', '8E.jpg', '9E.jpg', '10E.jpg', '1Eb.jpg', '2Eb.jpg', '3Eb.jpg', '4Eb.jpg', '5Eb.jpg', '6Eb.jpg', '7Eb.jpg', '8Eb.jpg', '9Eb.jpg'};
 
 ctr = 1; % counter
 obsNum = 1; % observer number
 tmp = 1;
 whereStr = 1;
 imNum = 1;
 numIms = 19;

% get image tracing data 
while whereStr < length(dataStr)
    dataChunk = dataStr{whereStr};
    if strcmp(dataChunk,'images')
        imNum = 1;      
        for tmp = 1:numIms
            eval(sprintf('d%s(imNum).name = fileNameStr{imNum};', num2str(obsNum)));                                                  
            % increment where we are in the data str
            whereStr = whereStr + 2;
            dataChunk = dataStr{whereStr};
            pctr = 1;
            while ~strcmp(dataChunk,'images') && whereStr < length(dataStr)
                eval(sprintf('d%s(imNum).points(pctr) = str2num(dataChunk);', num2str(obsNum)));
                whereStr = whereStr + 1;
                dataChunk = dataStr{whereStr};
                pctr = pctr + 1;
            end
            imNum = imNum + 1;
        end  
    end
    obsNum = obsNum + 1;
end

% compute ROIs 
numObs = 12; % number of observers

% test out on the first image
for imCtr = 1:1 
    natIm = imread(fileNameStr{imCtr});
    maskIm = zeros(size(natIm));
    tracedRegions = zeros(size(natIm));

    for obsCtr = 1:numObs
        eval(sprintf('maskIm = roipoly(maskIm, transpose(d%s(imCtr).points(2:2:end)), transpose(pointsd%s(imCtr).points(1:2:end)))'));
        tracedRegions = tracedRegions + maskIm;    
    end
end
