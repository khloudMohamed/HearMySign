%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% Calculate the Eculidan_Distance between x, y

function F = Eculidan_Distance (x,y)
          eculidan_distance=sqrt(  sum( ( (x-y).^2 ) ) );   %Caclualte Eculidan distance;
          F=eculidan_distance;
end