
tic
clear
close all
load('Descriptors.mat','Final') ;

%/*************************************************************************
%**************************************************************************
%************    Code part (1)****************************************
%This part used to Read all the images in the Database 
%(which has the specified path ) and Convert each image from RGB to YCBCR
%to be used for the skin detection adn segmentation 
% 
%the output of that part is a YCBCR image in binary mode Called YCBCR which is
%preprocessed with a filter of 500 pixel 
% The output image contains all objects which may represent a skin .
%**************************************************************************
%********************************************************************



    Image=imread('D:\G.project\graduation\sign language\numbers\6 (2).jpg');
  figure() ; imshow(Image)
i=rgb2ycbcr(Image);
Y=i(:,:,1);
Cb=i(:,:,2);
Cr=i(:,:,3);


[rows,colloums]=size(Y) ;
for l=1:rows
    for j=1:colloums 
       if(  ( Cb(l,j)<127) && (Cb(l,j)>=77)&& ( Cr(l,j)<173) && (Cr(l,j)>133)  )
         YCBCR(l,j)=1 ;
       else YCBCR(l,j)=0 ;

       end
               
 
    end
    
end

YCBCR2=imfill(YCBCR,'holes');
YCBCR3=bwareaopen(YCBCR2,500);
imshow(YCBCR3);

dim = size(YCBCR3)
col = round(dim(2)/2)-20;
row = min(find(YCBCR3(:,col)))
boundary = bwtraceboundary(YCBCR3,[row, col],'N');
imshow(i)
hold on;
plot(boundary(:,2),boundary(:,1),'g','LineWidth',3);

%boundaries = bwboundaries(boundary);
%for k=1:10
   %b = boundaries{k};
   %plot(b(:,2),b(:,1),'g','LineWidth',3);
%end

%*******************************************************************************************
x=boundary(:,1);
y1=boundary(:,2);
stp=length(x)
no_of_Samples= 128   % if we change the no. of samples the sampled_boundary will be affected
step=length(x)/no_of_Samples ;          
step1=uint16(step)            % uint16 ... bec length(x) is in range of 16 bit NOT 8 bit
                              % step1 must be outside for loop to find the integer no. we need for step so we don't have to repeat it  


xx=[];       %initialize new matrix
yy=[];       %initialize new matrix
for k=1:step1:stp; 
 
    xsampled=x(k);
    ysampled=y1(k);
    xx=[xx;xsampled];   %put each new value of xsampled in the next row of matrix xx
    yy=[yy;ysampled];   %put each new value of ysampled in the next row of matrix yy

end

sampled_boundary=[xx yy] % new sampled boundary 
figure,imshow(i)
hold on;
plot(sampled_boundary(:,2),sampled_boundary(:,1));  %plot sampled_boundary


%**************************************************************************
%**************************************************************************
%**************************************************************************


%**************************************************************************
%*********** Code part (4) **********************************************
% This part used to calculate the Centroid Co-ordinates (Xc,Yc)

Xc=mean(xx);
Yc=mean(yy);


%**************************************************************************
%**************************************************************************
%*******************





%**************************************************************************
%**************** Code part(5 ) **************************************
% Calculating the First Descriptor (Radial Distance)
% ***************************************************************



distance1=(yy(1:end)-Yc).^2 ;              %Distance1= (y-Yc ).^2 
distance2= (xx(1:end)-Xc).^2  ;        %Distance2 = (x-Xc).^2 
Radialdistance = sqrt(distance1+distance2);  %Find the Radial Distance
F=fft(Radialdistance);                       %Find the Fourier Transform of the RadialDistance 
 
FDcentroid=abs(F)/abs(F(1));                 %Normalize the FOuerier Transform 



%**************************************************************************
%**************************************************************************
%***************Classification part
%***********************************************************************

Databasesize= size(Final(1,1:end));
Databasesize=Databasesize(2)  ;   



Error1sum=0 ;  Min1sum=1000 ; 

 for imagenumber=1 : Databasesize 
 Error1sum=0 ;

 Error1= abs(  (FDcentroid(1:end,1)-(Final(1:end,imagenumber)) ) );
   
 Error1sum=sum(Error1);
  
 
           if(Error1sum<=Min1sum) 
                  Min1sum=Error1sum ;
             Querynumber1=imagenumber-1 ; 
           end
 
           
  end

Querynumber1


















