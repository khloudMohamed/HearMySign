%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
%function used to find samples in an image , 
%output :  sampled rows , sampled colloums


function [rows,colloums]=Find_image_sample(YCBCR,samplesnumber)

 
    points=bwboundaries(YCBCR);                        %Find the Edge Co-ordinates  
    contourpoints=points{1,1};                         %Find the contour points 
    
    rows=contourpoints(1:end,1);                       %contour rows 
    colloums=contourpoints(1:end,2);                   %conotur colloums
   
    step=size(rows,1)/samplesnumber;                   %Calculate a step to be used in sampling to 128 elemnt 
    
    rows=rows(1:step:end);                             %Find the sampled rows 
    colloums=colloums(1:step:end);                     %Find the sampled colloums 

F=[rows,colloums];

end