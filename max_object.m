%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
 %*This part use the YCBCR image to Detect the skin parts of the image and
 %find only one object in the image (which has the greatest area ) which
 %assumed to be the hand 
 
 % Part Assumptions : the Hand has the greatest area in the image .
 % code output : image called YCBCR which contain only one object (Hand )
 
 %*************************************************************************
 %*************************************************************************
 %************************************
 
 function F=max_object(YCBCR)
 
imdata=regionprops(YCBCR,'basic');                  %Find the properties of the image  
allareas=[imdata.Area];                             %Find the areas of the objects found in the image 
y=size(allareas);                                   %Find the number of elements in the image  as a vector 
y=y(2); maxarea=0;                                  % Find the number of elements in the image as a number
for x=1 :y                                          % use for loop to detect the max area of the object 

      if (allareas(x)>maxarea )
        maxarea = allareas(x); 
     end
end
YCBCR=bwareaopen(YCBCR,maxarea);                   %Filter the images object which has area less than the max area to keep only one object in image
 
F=YCBCR;
% F=allareas;
 end