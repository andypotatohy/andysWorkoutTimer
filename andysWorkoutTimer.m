function andysWorkoutTimer(numCircuit,numExercise,lenExercise,lenRest)
% andysWorkoutTimer(numCircuit,numExercise,lenExercise,lenRest)
% 
% A smart timer for your workout. You can customize everything, including:
% 
% numCircuit: number of circuits in your entire workout, default to 3;
% numExercise: number of exercises in each circuit, default to 5;
% lenExercise: length of each exercise, default to 45 seconds;
% lenRest: length of recovery time between exercises, default to 15
% seconds.
% 
% This timer is especially good for doing HIIT at various fitness levels.
% 
% andypotato, May 2017

if nargin<1
    numCircuit = 3;
    numExercise = 5;
    lenExercise = 45;
    lenRest = 15;
end

if lenExercise < 15
    error('Each exercise should be at least 15 seconds!');
end
if lenRest <10
    error('Dude you need to rest at least 10 seconds!');
end
if lenRest > 20
    error('Rest time should not exceed 20 seconds!');
end

readyVoice = {'Get ready to start!','Get ready for the next one!'};
startVoice = {'Let''s do it!','Let''s go!','Here we go!','Start!','Now game time!'};
restVoice = {'That''s it, take a break!','Good job, have a rest!','Nice, get some water!'};
cirDoneVoice = {'Circuit done, now relax for a while!'};
endVoice = {'Workout done! Good job!'};

pause on;

for i=1:numCircuit
    
    for j=1:numExercise
        
        if j==1, indFile = 1; else, indFile = randi(length(readyVoice)); end
        timerOut(readyVoice{indFile},['ready_' num2str(indFile) '.wav']);
        timerCountDown(5);
        
        indFile = randi(length(startVoice));
        timerOut(startVoice{indFile},['start_' num2str(indFile) '.wav']);
        timerPush(lenExercise);
        
        if j<numExercise
            indFile = randi(length(restVoice));
            timerOut(restVoice{indFile},['rest_' num2str(indFile) '.wav']);
            pause(lenRest-5);
        else
            break;
        end
    end
    
    if i<numCircuit
        indFile = 1;
        timerOut(cirDoneVoice{indFile},['cirDone_' num2str(indFile) '.wav']);
        pause(lenRest-5+10);
    else
        indFile = 1;
        timerOut(endVoice{indFile},['end_' num2str(indFile) '.wav']);
    end
    
end

pause off;
