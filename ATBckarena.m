function ATBckarena (arduino)

    %camera=webcam('Nome_Webcam');
    %image=snapshot(camera);
    pixel=600;
    image=imread('prova.png');
    red=image(:, :, 1);
    blue=image(:, :, 2);
    green=image(:, :, 3);
    grayMin={128, 128, 128};
    grayMax={220, 220, 220};
    imageLogic=image>soglia_grigio;
    imageCorrect=bwareaopen(imageLogic, soglia_grigio);    
    
    for a=1:1:pixel
        
        for b=1:1:pixel
            
            for c=1:1:pixel
                
                if grayMin<image(a, b, c)<grayMax
                    
                    gray(a, b, c)=true;
                    
                end
               
            end
            
        end
        
    end
    
    [riga, colonna]=find(gray(1:pixel/2, :));
    
    xa=round(mean(riga));
    ya=round(mean(colonna));
    
    [riga2, colonna2]=find(gray(pixel/2:pixel, :));
    
    xb=roun(mean(riga2));
    yb=round(mean(colonna2));
    
    coefficiente_angolare=sqrt((xa-xb)^2+(ya-yb)^2);
    alpha=atan(coefficiente_angolare);
    
    disp(alpha);
    
    ATBmove(alpha);
    
end