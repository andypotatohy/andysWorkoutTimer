function timerCountDown(len)

fs = 44100;
t = (1:fs/2)/fs;

timeDown = len:-1:1;

for ti=1:length(timeDown)
    ts = tic;
    fprintf('%d ...\n',timeDown(ti));
    soundsc(sin(2*pi*700*t),fs);
    tp = toc(ts);
    pause(1-tp);
end