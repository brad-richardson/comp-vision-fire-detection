% Brad Richardson
% Final Project
% Fire detection in video

close all;
clear variables;

smallVideos = [string('forestfire-sm.mp4'), string('firetruck-sm.mp4'), string('helmetfire-sm.mp4')];
largeVideos = [string('forestfire.mp4'), string('firetruck.mp4'), string('helmetfire.mp4')];

videos = smallVideos;

for i = 1:size(videos, 2)
    tic;

    % Open videos for reading/writing
    file = videos(i);
    in = VideoReader(sprintf('./video/%s', file));
    frameCount = round(in.Duration*in.FrameRate);
    fprintf('Frames to read: %d\n', frameCount);
    outFireOnly = VideoWriter(sprintf('./out/fire-only-%s', file), 'MPEG-4');
    outColored = VideoWriter(sprintf('./out/colored-%s', file), 'MPEG-4');
    open(outFireOnly);
    open(outColored);

    % Counters for previous frame fire detection and current frame index,
    % overall frames with fire detected
    previousFrames = zeros(100, 1);
    previousFramesIdx = 1;
    previousFramesFires = 0;
    overallFireFrames = 0;
    frameIdx = 1;
    while hasFrame(in)
        frame = readFrame(in);

        % Process and output results
        tauValue = 40; % TODO - use previous frames' fires to calculate between 50-96
        [fireDetected, fireOnlyIm, ~] = FireDetection(frame, tauValue);
        previousFrames(previousFramesIdx) = nnz(fireDetected) > 0;
        writeVideo(outFireOnly, fireOnlyIm);
        changedIm = MatchColorChange(frame, fireDetected, 0, 0, 255);
        writeVideo(outColored, changedIm);

        % Recalculate previous flames with fire for tau value,
        % output every 100 frames to see progress and keep track of fire frames
        previousFrameFires = nnz(previousFrames);
        if mod(frameIdx,100) == 0
            overallFireFrames = overallFireFrames + previousFrameFires;
            fprintf('%d frames read (%d%% with fire)\n', frameIdx, previousFrameFires);
        end

        % Increment counters
        previousFramesIdx = previousFramesIdx + 1;
        if previousFramesIdx > 100
            previousFramesIdx = 1;
        end
        frameIdx = frameIdx + 1;
    end

    % Close all output files and print results
    close(outFireOnly);
    close(outColored);
    fprintf('Total frames with fire: %d/%d (%.2f%%)\n', overallFireFrames,...
        frameCount, 100.0*double(overallFireFrames)/double(frameCount));
    toc;
end
