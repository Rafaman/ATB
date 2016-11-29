function ATBckarena (arduino)

    %camera=webcam('Nome_Webcam');
    %image=snapshot(camera);
    pixelX=640;
    pixelY=480;
    soglia_rumore_grigio=10;
    image=imread('prova.png');
    grayMin=[128 128 128];
    grayMax=[220 220 220];
    gray=zeros(pixelY, pixelX);
    imageLogic=image>soglia_rumore_grigio;
    imageCorrect=bwareaopen(imageLogic, soglia_rumore_grigio);    
    
    for a=1:1:pixelY
        
        for b=1:1:pixelX
            
            if grayMin<=image(a, b)<=grayMax

                gray(a, b)=image(a, b);

            end

        end
        
    end

    [riga, colonna]=find(gray(1:pixelX/2, :));
    
    xa=round(mean(riga));
    ya=round(mean(colonna));
    
    [riga2, colonna2]=find(gray(pixelX/2+1:pixelX, :));
    
    xb=round(mean(riga2));
    yb=round(mean(colonna2));
    
    coefficiente_angolare=yb-ya/xb-xa;
    angolo=atan(coefficiente_angolare);
    
    if angolo>0
        
        mode=3;
        
    else
       
        mode=4;
        
    end
    
    ATBmove(mode, angolo, distance);
    
end