%% offline_training 
%% ..............Copy right .....
%%             Khloud Mohamed 
%% Helwan university ,Biomedical , Computer science Departments 
% function to compare homogenouse features (it's a KNN_Classifier using k=1)
% used functions : Eculidan_Distance
% output : is the Nearst Neghibour for the input Query 

function Querynumber= compare_homogenouse_feature(Query_vector,Dataset_vectors)

   Databas_elength=size(Dataset_vectors,1); %Find the Feature vector length 
   Database_width= size(Dataset_vectors,2); %Find the Number of images in Dataset (Number of images* Number of instances for each image)
   Distance=0 ;  Minsum=10000000000000000000 ;
    x=Query_vector;                        %put the Query vector in X
     for imagenumber=1 : Database_width    %for all vectors in the Dataset
        Distance=0 ;                       %initilaize the Distance to 0
        y= Dataset_vectors(1:end,imagenumber); %for the ith vector in the Dataset call it y 
        Distance= Eculidan_Distance (x,y);     %Find the eculidian distance between x and y 
        
          if(Distance<=Minsum)               %save the Minimin Distance and find the corresponding query number
                  Minsum=Distance ;
                  Querynumber=imagenumber ; 
          end
     end
  F=Querynumber;
end



