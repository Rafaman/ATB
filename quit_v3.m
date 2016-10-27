function quit_v3(btn4, handle4)

    global vrep clientIDdouble
    
    [~]=vrep.simxStopSimulation(clientIDdouble, vrep.simx_opmode_oneshot_wait);
    vrep.simxFinish(clientIDdouble);

    close;

end