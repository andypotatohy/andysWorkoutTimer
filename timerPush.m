function timerPush(len)

pushVoice = {'10 seconds, you''re doing good!','20 seconds, keep pushing!',...
    '30 seconds, you''re strong!'};
finalPush = {'Come on, last push!'};

% pause on;

m = min(floor((len-5)/10),length(pushVoice));

remain = (len-5) - m*10;

for i=1:m
    
    pause(10);
    
    if i<m
    timerOut(pushVoice{i},['push_' num2str(i) '.wav']);
    elseif i==m && remain>0
        timerOut(pushVoice{i},['push_' num2str(i) '.wav']);
    end
    
end

pause(remain);

timerOut(finalPush{1},'push_end.wav');
timerCountDown(5);

% pause off;
