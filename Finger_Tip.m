clc
close all
clear

i=imread('9.1 (10).jpg');
i2=skin_detection(i);
YCBCR=max_object(i2) ;
samplesnumber=128;
%% [sampledrows,sampledcolloums]=Find_image_sample(YCBCR,samplesnumber);
    points=bwboundaries(YCBCR);                        %Find the Edge Co-ordinates  
    contourpoints=points{1,1};                         %Find the contour points 
    
    origirnal_rows=contourpoints(1:end,1);                       %contour rows 
    origirnal_colloums=contourpoints(1:end,2);                   %conotur colloums
   
    step=size(origirnal_rows,1)/samplesnumber;                   %Calculate a step to be used in sampling to 128 elemnt 
    
    sampled_rows=origirnal_rows(1:step:end);                             %Find the sampled rows 
    sampled_colloums=origirnal_colloums(1:step:end);                     %Find the sampled colloums 


%% End of the Find_Image_Sample 
 im=Draw_contour(sampled_rows,sampled_colloums,YCBCR);
 RGB=zeros(size(im));
 yc=mean(sampled_rows);
 
 for r=2:size(sampled_rows)-1
    if(  (sampled_rows(r)<=sampled_rows(r+1)) && (sampled_rows(r)<=sampled_rows(r-1)) && (sampled_rows(r)<yc)&&(RGB(sampled_rows(r-1),sampled_colloums(r-1))==0)&&(RGB(sampled_rows(r+1),sampled_colloums(r+1))==0) )
        RGB(sampled_rows(r),sampled_colloums(r))=1;
        position=[sampled_rows(r),sampled_colloums(r)];
%         itotal = insertMarker(i,position,'x','color','green','size',10);
    else
         RGB(sampled_rows(r),sampled_colloums(r))=0;
    end
 end
 
 figure();imshow(RGB);
 [y,x]=find(RGB);
 
%  figure();imshow(itotal)
        %  for r=1:128
%      for c=1:128
%          if(im(r,c)==1)
%              if(  (rows2(r)>=rows2(r+1)) && (rows2(r)>=rows2(r-1)) )
%                  RGB(r,c)=1;
%              end
%          end
%      end
%  end


%% Classification phase :
   if length(y)<=3 ;
     Query=6
   else
     Peak=Find_Max_Element(y);
     switch Peak
      case (2)
          Query=7 
          break; 
      case (3)
          Query=8
          break; 
      case (4) 
          Query=9
          break;

     end
   
   end
   