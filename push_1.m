function push_1 (btn3, handle)

global vrep clientIDdouble jointHandleFDX jointHandleFSX asse_ruote raggio_ruote

    vrep.simxStartSimulation(clientIDdouble, vrep.simx_opmode_oneshot);

    angolo=randperm(90, 1);
    distance=randperm(30, 1);
    distance_tot=distance+2*pi*asse_ruote*angolo/360;
    velocityMax=2*pi*raggio_ruote;
    time=distance_tot/velocityMax;
    velocityReal=distance/time;
    time_giro=(2*pi*asse_ruote*angolo/360)/velocityReal;
    
    cronometro=tic;
    cronometro_giro=tic;
    
    time_cronometro=toc(cronometro);
    
    while time_cronometro<time
        
        cronometro2=tic;
        time_cronometro_giro=toc(cronometro_giro);
        
        while time_cronometro_giro<time_giro && time_giro~=0
        
            cronometro_giro2=tic;
            vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFDX, 0, vrep.simx_opmode_blocking);
            vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFSX, velocityReal, vrep.simx_opmode_blocking);
            time_cronometro_giro2=toc(cronometro_giro2);
            time_cronometro_giro=time_cronometro_giro+time_cronometro_giro2;
            
        end
                
        toc(cronometro_giro);
        
        vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFDX, 0, vrep.simx_opmode_blocking);
        vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFSX, 0, vrep.simx_opmode_blocking);
        vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFDX, 100, vrep.simx_opmode_blocking);
        vrep.simxSetJointTargetVelocity(clientIDdouble, jointHandleFSX, 100, vrep.simx_opmode_blocking);
        
        time_cronometro2=toc(cronometro2);
        time_cronometro=time_cronometro+time_cronometro2;    
        
    end
    
    toc(cronometro);

    vrep.simxPauseSimulation(clientIDdouble, vrep.simx_opmode_oneshot);
    
end