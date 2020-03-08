%% offline_training 
%% ..............Copy right Khloud Mohamed .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% function to find the Radial_Signature of the input rows, colloums of an
% image 
% output :  the FD_Centroid which is the FFt of the Radial_Signature .
%           the Radial_distance which is the Radial_distance of the image .
function [FDcentroid,Radialdistance]=Calculate_Radial_signature(sampledrows,sampledcolloums)
                     
Xc=mean(sampledcolloums);
Yc=mean(sampledrows) ;

distance1=(sampledrows(1:end)-Yc).^2 ;              %Distance1= (y-Yc ).^2 
distance2= (sampledcolloums(1:end)-Xc).^2  ;        %Distance2 = (x-Xc).^2 
Radialdistance = sqrt(distance1+distance2);  %Find the Radial Distance



F0=fft(Radialdistance);                       %Find the Fourier Transform of the RadialDistance 
FDcentroid=abs(F0)/abs(F0(1));                 %Normalize the FOuerier Transform

     
F=[FDcentroid,Radialdistance];
end