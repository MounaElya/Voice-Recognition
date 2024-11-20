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
%Feature Extraction
f=VoiceFeatures(data);
%Save users data
uno=input('Enter the user number:');
try
    load database
    F=[F;f];
    C=[C;uno];
    database=[database;F;C];
    save database.mat database F C
catch
    F=f;
    C=uno;
    save database F C
end
msgbox('Your voice registered')