function ATBmove (mode, angolo, distance, servoDX, servoSX)

%Creazione array
    
    modalita=zeros(1, 6);
    raggio_curva_piccola=0;
    distance_tot=zeros(1, 10);
    time=zeros(1, 10);
    time_giro=zeros(1, 10);
    velocityReal=zeros(1, 10);
    velocityMax=2*pi*raggio_ruote;
    velocityDX=zeros(1, 10);
    velocitySX=zeros(1, 10);
    mode=a;
    
%Calcolo tempo e velocità
    
    for i=1:1:10
        
        distance_tot(i)=distance(i)+2*pi*asse_ruote*abs(angolo(i))/360;
        time(i)=distance_tot(i)/velocityMax;
        velocityReal(i)=2*pi*raggio_curva_piccola*angolo(i)/360/time(i);
        time_giro(i)=(2*pi*raggio_curva_piccola*angolo(i)/360)/velocityReal(i);
        
        if velocityReal(i)>0
            
            velocityDX(1, i)=velocityReal(i)/velocityMax*0.5+0.5;
            velocitySX(1, i)=1;
            
            velocityDX(5, i)=velocityReal(i)/velocityMax*0.5+0.5;
            velocitySX(5, i)=0;
            
        elseif velocityReal(i)<0
            
            velocityDX(2, i)=1;
            velocitySX(2, i)=velocityReal(i)/velocityMax*0.5+0.5;
            
            velocityDX(6, i)=0;
            velocitySX(6, i)=velocityReal(i)/velocityMax*0.5+0.5;
            
        else
            
            velocityDX(1, i)=1;
            velocitySX(1, i)=1;
            
            velocityDX(2, i)=1;
            velocitySX(2, i)=1;
            
            velocityDX(5, i)=0;
            velocitySX(5, i)=0;
            
            velocityDX(6, i)=0;
            velocitySX(6, i)=0;
        
    end
       
    time(3)=(angolo(1)*2*pi*(asse_ruote/2)/360)/velocityMax;
    time(4)=(angolo(1)*2*pi*(asse_ruote/2)/360)/velocityMax;
    
    velocityDX(3)=1;
    velocitySX(3)=0; 
    
    velocityDX(4)=0;
    velocitySX(4)=1; 
    
%Creazione modi 
    
    modalita(1)=[time(1), time_giro(1), velocityDX(1), velocitySX(1)];
    modalita(2)=[time(2), time_giro(2), velocityDX(2), velocitySX(2)];
    modalita(3)=[time(3), time_giro(3), velocityDX(3), velocitySX(3)];
    modalita(4)=[time(4), time_giro(4), velocityDX(4), velocitySX(4)];
    modalita(5)=[time(5), time_giro(5), velocityDX(5), velocitySX(5)];
    modalita(6)=[time(6), time_giro(6), velocityDX(6), velocitySX(6)];
    
%Movimento
    
    cronometro=tic;
    cronometro_giro=tic;
    
    while cronometro<time(a)
        
        while cronometro_giro<time_giro(a) && time_giro(a)~=0
        
            writePosition(servoDX, velocityDX(a));
            writePosition(servoSX, velocitySX(a));          
            
        end
        
        toc(cronometro_giro);
                        
        writePosition(servoDX, 1);
        writePosition(servoSX, 1);
        
    end
    
    toc(cronometro);
    
end
    
    
    
    
