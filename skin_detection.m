%% Skin_Detection
%% ..............Copy right Khloud Mohamed .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
%function used to detect the skin parts in the image 
%output : is an image containing skin parts 

function F =skin_detection(Image)

    Image=imresize(Image,[360 360 ] );
    Image2=rgb2ycbcr(Image);                            %Convert the image from RGB to YCBCR
    Y=Image2(:,:,1);                                    %Get the Y value of the image 
    Cb=Image2(:,:,2);                                   %Get the Cb value of the image
    Cr=Image2(:,:,3);                                   %Get the Cr value of the image

   [rows,colloums]=size(Y) ;                            %Detect the size  of the Rows and colloums
 %% For  all the image pixels if the pixel is in the specified range then it's a skin 
 %% so but it in the binary image as 1 ...else but it 0
   for l=1:rows                                          %Read one row each time 
    for j=1:colloums                                  %Read one colloum each time
       if(  ( Cb(l,j)<=127) && (Cb(l,j)>=77)&& ( Cr(l,j)<=173) && (Cr(l,j)>=133)  )          %Skin Detection values 
          YCBCR(l,j)=1 ;                           
       else
           YCBCR(l,j)=0 ;
       end             
    end    
   end


YCBCR=imfill(YCBCR,'holes');                       %Fill the image.
YCBCR=bwareaopen(YCBCR,500);                       %Preprocessing Fitler to Filter images less than 500 pixel 

F=YCBCR;
end