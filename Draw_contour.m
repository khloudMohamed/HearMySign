%% offline_training 
%% ..............Copy right "Khloud Mohamed" .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
%function to draw the contour using the Binary image and the sampled rows
%and sampled colloums 

function F=Draw_contour(rows,colloums,YCBCR)


      sampledimage=zeros(size(YCBCR));                   %Create sampled image which has the same size of the original image 
      rowsno=size(rows);
      for is=1 : rowsno                                     %but the sampled rows and colloums value in the Created sampled image 
             sampledimage( rows(is) , colloums(is) )=1 ;
      end
%     imshow(sampledimage);
    F=sampledimage;
end