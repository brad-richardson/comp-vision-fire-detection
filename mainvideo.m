% Brad Richardson
% Final Project
% Fire detection in video

close all;
clear variables;
file = 'firetruck-sm.mp4';
in = VideoReader(sprintf('./video/%s', file));
fprintf('Frames to read: %d\n', round(in.Duration*in.FrameRate));

out = VideoWriter(sprintf('./out/%s', file), 'MPEG-4');
open(out);
i = 0;
while hasFrame(in)
    frame = readFrame(in);
    [fireDetected, ~, ~] = FireDetection(frame);
    changedIm = MatchColorChange(frame, fireDetected, 0, 0, 255);
    writeVideo(out, changedIm);
    if mod(i,100) == 0
        fprintf('%d frames read\n', i);
    end
    i = i + 1;
end
    
    
close(out);