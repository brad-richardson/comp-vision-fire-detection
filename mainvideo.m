% Brad Richardson
% Final Project
% Fire detection in video

close all;
clear variables;

smallVideos = [string('forestfire-sm.mp4'), string('firetruck-sm.mp4'), string('helmetfire-sm.mp4')];
largeVideos = [string('forestfire.mp4'), string('firetruck.mp4'), string('helmetfire.mp4')];

videos = smallVideos;

for i = 1:size(videos, 2)
    file = videos(i);
    in = VideoReader(sprintf('./video/%s', file));
    fprintf('Frames to read: %d\n', round(in.Duration*in.FrameRate));

    out = VideoWriter(sprintf('./out/%s', file), 'MPEG-4');
    open(out);
    j = 0;
    while hasFrame(in)
        frame = readFrame(in);
        [fireDetected, ~, ~] = FireDetection(frame, 40);
        changedIm = MatchColorChange(frame, fireDetected, 0, 0, 255);
        writeVideo(out, changedIm);
        if mod(j,100) == 0
            fprintf('%d frames read\n', j);
        end
        j = j + 1;
    end
    close(out);
end
