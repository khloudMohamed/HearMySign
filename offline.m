%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% This script is used to produce the 'Numbers_Descriptors_Rad' which contains the 
% Radial_Signature descriptors for Numbers (1 : 9 ) using 50 instance for
% each number for the training phase .
% output :('Numbers_Descriptors_Rad','Radial_Signature')
% used functions :      
%          skin_detection,max_object,Find_image_sample,Calculate_Radial_signature
%%
clc
close all
clear
%% Initialize variables :
samplesnumber=128; 
Radial_Signature=[];        % Variable used to save the Radial_Signature 
%% Start looping each number's folder :
file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\1\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\1\', file(k).name)); %Read image from folder  
    %For every iteration Initialize all variables :
    Image=[]; YCBCR=[];i2=[];       
    Image = images{k};        %Read one image from the folder                          
   
    i2=skin_detection(Image); % detect the skin parts in the image 
    YCBCR=max_object(i2) ;     %Find the max object in the image 
    
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the feature (Radial  vector which is an contour  based feature)
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];

end


file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\2\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\2\', file(k).name)); 
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
   
    
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end

file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\3\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\3\', file(k).name)); 
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
    
   
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end
file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\4\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\4\', file(k).name));  
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
   
   
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end
file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\5\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\5\', file(k).name)); 
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
   
    
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end

file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\6\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\6\', file(k).name));  
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
   
    
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end
file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\7\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\7\', file(k).name));  
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
   
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end

file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\8\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\8\', file(k).name));  
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
   
    
    
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
   
end

file = dir('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\9\*.jpg');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF  
    images{k} = imread(fullfile('C:\Users\Ahmed\Documents\MATLAB\NumbersTraining\9\', file(k).name)); 
    Image=[]; YCBCR=[];i2=[];
    Image = images{k};                             %Read the image as matlab input 
     
    i2=skin_detection(Image);
    YCBCR=max_object(i2) ;
%Find the image samples which is 128 sample number   
    [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);  
%Find the 2nd feature (Radial  vector which is an contour  based feature and compare  )
    [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums);
    Radial_Signature=[Radial_Signature,FDcentroid];
  
end

 save('Numbers_Descriptors_Rad','Radial_Signature');