%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% function used to detect the finger_Tips in the image and classifty the queries(6,7,8,9) :
%used functions : Draw_contour,Find_Max_Element .
%out of the function : 0 for the numbers (1,2,3,4,5)  
%                      6 for number 6 , 7 for number 7 , 8 for number 8 or
%                      9 for number 9 .
function F= Finger_Tip_Detector(sampled_rows,sampled_colloums,YCBCR)
   Query=0;                                    %initialize the Query number to 0;
 im=Draw_contour(sampled_rows,sampled_colloums,YCBCR);%Draw the contour for the sampledimage
 RGB=zeros(size(im));                           %Create new image using the same size of the im 
 yc=mean(sampled_rows);                         %Find the mean of colloums of the samples in  the image
     %% if the sample(r) is higher than sample(r+1) and sample(r-1) then
     % sample (r) is peak .
     % if the sampel is peak and in the half upper part of the image (>yc)
     % then it's a finger tip 
     % to Detect only one sample for each tip, each finger tip must be only
     % one so if ther's 2 consequent finger tip in the image , then put
     % only one of them in the RGB image 
 for r=2:size(sampled_rows)-1                   % For all imagessamples
    if(  (sampled_rows(r)<=sampled_rows(r+1)) && (sampled_rows(r)<=sampled_rows(r-1)) && (sampled_rows(r)<yc)&&(RGB(sampled_rows(r-1),sampled_colloums(r-1))==0)&&(RGB(sampled_rows(r+1),sampled_colloums(r+1))==0) )
        RGB(sampled_rows(r),sampled_colloums(r))=1;
    else
         RGB(sampled_rows(r),sampled_colloums(r))=0;
    end
 end
 %%
 [y,x]=find(RGB); %find the samples in the RGB(new image 
 %if ther's only 3 peaks in the image or lower  Query=6 .
 if (length(y)<=3)  
     Query=6;
 %Else if there's 4 fingers tip in the image   
 elseif (length(y) ==4) 
     Peak=Find_Max_Element(y);    %Find the Lowers finger tip position 
     switch Peak
      case 2                  %if the lower finger tip is the 2nd tip then it's number 7 
          Query=7;  
      case 3
          Query=8;            %if the lower finger tip is the 3rd tip then it's number 8 
      case 4 
          Query=9;            %if the lower finger tip is the 4th tip then it's number 9 
     end
 else
     Query=0;              %if number of finger tips is more than 4 then query haven't been recognized 
   end
 
 F=Query;                  %retrun the Query
end