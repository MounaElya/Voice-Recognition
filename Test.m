clear all;
close all;
clc;
% create a recorder object
recorder = audiorecorder(16000,8,2);
% record user's voice for 5sec
disp('please record your voice');
drawnow();
pause(1);
recordblocking(recorder, 5);
play(recorder);
data=getaudiodata(recorder);
plot(data)
figure;
% Feature Extraction
load database
f=VoiceFeatures(data);
f
% Classify 

D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f))
    D=[D d];
end
% Smallest distance
sm=inf;
ind=-1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=C(ind);
disp('The detected class is : ');
detected_class