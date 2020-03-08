%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% This script is udsed to take a real time image and classify it based on
% the Knn_Classifier and using Finger_Tip Detector technique 
%used function :     
%          skin_detection,max_object,Calculate_Radial_signature,
%          compare_homogenouse_feature,Query_no_identifer,Finger_Tip_Detector,
%          text_inserter
% Output : is an Binary image and inserted on it the classified number 
clc
close all
clear

samplesnumber=128; 
instancesnumber=50; 

numbers=[1 2 3 4 5 6 7 8 9 ];
load('Numbers_Descriptors_Rad','Radial_Signature');

%Start video capturing :
vid=imaq.VideoDevice('winvideo',1,'MJPG_1280x720');
while (1)
%Read image (one frame )from the video 
       pause(0.001);
      frame = step(vid); 
      img=uint8(255*frame);
%Image read and pre processing of skin detection and max object obtaing     
      i2=skin_detection(img);
      YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
      [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Querynumber2= compare_homogenouse_feature(FDcentroid,Radial_Signature);
 
    Querynumber2= Query_no_identifer(Querynumber2,instancesnumber);
    R_dimension=numbers(Querynumber2);
 
    if((R_dimension>=6)||(R_dimension==4))
        Query=Finger_Tip_Detector(sampledrows,sampledcolloums,YCBCR);
         if(Query~=0)
          R_dimension=Query; 
         end
    end
        %show the result binary image with each claasification :
         YCBCR=text_inserter(YCBCR,R_dimension,0,'0','0','0','0');
        %Find status of the bw image to detect if hand in image or not 
        stats=regionprops(YCBCR,'Centroid');
        if(length(stats))
            imshow(YCBCR);
        else
            return
        end 
end