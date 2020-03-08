%% offline_training 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% Function used to identify the number by defining the instances no in the
% training phase and the Output Query_number 

function F= Query_no_identifer(querynumber,instances_no)
            querynumber=ceil(querynumber/instances_no) ;   %Find the real number of the Query 
            F=querynumber ;
end