function ATBmove (mode, angolo, distance, servoDX, servoSX)

%Creazione array
    
    mode=zeros(1, 5);
    angolo=zeros(1, 10);
    distance=zeros(1, 10);
    distance_tot=zeros(1, 10);
    delta_time=zeros(1, 10);
    velocityReal=zeros(1, 10);
    velocityMax=2*pi*raggio_ruote;
    velocityDX=zeros(1, 5);
    velocitySX=zeros(1, 5);
    
%Calcolo tempo e velocità
    
    for i=1:1:5
        
        distance_tot(i)=distance(i)+2*pi*asse_ruote*angolo(1)/360;
        delta_time(i)=distance_tot(i)/velocityMax;
        velocityReal(i)=distance(i)/delta_time(i);
        
    end
       
    delta_time(3)=(angolo(1)*2*pi*(asse_ruote/2)/360)/velocityMax;
    
%Trasformazione velocità in modalità servo

    velocityDX(1)=velocityReal(1)/velocityMax;
    velocitySX(1)=1;
    velocitySX(2)=velocityReal(2)/velocityMax;
    velocityDX(2)=1;
    velocityDX(3)=1;
    velocitySX(3)=0;
    velocityDX(4)=velocityReal(4)/velocityMax;
    velocitySX(4)=0;
    velocitySX(5)=velocityReal(5)/velocityMax;
    velocityDX(5)=0;
    
%Creazione modi 
    
    mode(1)=[delta_time(1), velocityDX(1), velocitySX(1)];
    mode(2)=[delta_time(2), velocityDX(2), velocitySX(2)];
    mode(3)=[delta_time(3), velocityDX(3), velocitySX(3)];
    mode(4)=[delta_time(4), velocityDX(4), velocitySX(4)];
    mode(5)=[delta_time(5), velocityDX(5), velocitySX(5)];
    
%Movimento
    
    tic(cronometro);
    
    while cronometro~=delta_time
        
        writePosition(servoDX, velocityDX);
        writePosition(servoSX, velocitySX);
        
    end
    
    toc;
    
end
    
    
    
    
