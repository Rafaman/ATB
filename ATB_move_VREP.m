clc;
clear;

%Dichiarazioni Variabili

global vrep clientIDdouble jointHandleFDX jointHandleFSX visionHandle1 raggio_ruote asse_ruote

vrep=remApi('remoteApi');
vrep.simxFinish(-1);
IPaddress='127.0.0.1';
portNumber=19997;
waitUntilConnected=true;
doNotReconnectOnceDisconnected=false;
timeOutInMs=5000;
commThreadCycleInMs=5;

asse_ruote=6.15;
raggio_ruote=1.5;

%SIMULAZIONE VREP

clientIDdouble=vrep.simxStart(IPaddress,portNumber,waitUntilConnected, ... 
    doNotReconnectOnceDisconnected, timeOutInMs,commThreadCycleInMs);
pause(5);
vrep.simxStartSimulation(clientIDdouble,vrep.simx_opmode_oneshot);

%Creazione Handle Oggetti

[~, jointHandleFDX]=vrep.simxGetObjectHandle(clientIDdouble, 'JointFDX', vrep.simx_opmode_blocking);
[~, jointHandleFSX]=vrep.simxGetObjectHandle(clientIDdouble, 'JointFSX', vrep.simx_opmode_blocking);
[~, visionHandle1]=vrep.simxGetObjectHandle(clientIDdouble, 'Vision1', vrep.simx_opmode_blocking);

%Creazione GUI

figure1 = figure('Color',[0 0.447058826684952 0.74117648601532], ...
    'MenuBar', 'none');
    
set(gcf,'NumberTitle','off');
set(gcf,'Name','ATB Vision'); 

btn4 = uicontrol('Style', 'pushbutton', 'String', {'QUIT'},...
'Position',  [20 20 60 20],...
'Callback', @quit_v3);

btn3 = uicontrol('Style', 'pushbutton', 'String', {'1'},...
'Position',  [100 20 60 20],...
'Callback', @push_1);

btn2 = uicontrol('Style', 'pushbutton', 'String', {'2'},...
'Position',  [180 20 60 20],...
'Callback', @push_2);

btn1 = uicontrol('Style', 'pushbutton', 'String', {'3'},...
'Position',  [260 20 60 20],...
'Callback', @push_3);

vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFDX, 0, vrep.simx_opmode_blocking);
vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFSX, 0, vrep.simx_opmode_blocking);






    
    

