function timerOut(info,audioFile)

disp(info);

[x,fs] = audioread(audioFile);
soundsc(x,fs);