%% Text_Inserter 
%% ..............Copy right .....
%%             Hear My Sign Team 
%% Helwan university ,Biomedical , Computer science Departments 
% Function used  to insert a text for the image 


function F =text_inserter(YCBCR,Querynumber1,Querynumber2,Querynumber3,Querynumber4,Querynumber5,Querynumber6)
 
YCBCR=~YCBCR;                       %Invert the image 
textColor    = [0, 0, 0];           %Detecet the color as black color 
textLocation1 = [0 00];             %Position for the text:
textLocation2 = [0 20];
textLocation3 = [0 40];
textLocation4 = [0 60];
textLocation5 = [0 80];
textLocation6 = [0 100];

Querynumber1=int2str(Querynumber1); %Convert the number from in to str to display it 
Querynumber2=int2str(Querynumber2);
      % Using the predefined color and text location create textInserter1 
textInserter1 = vision.TextInserter(Querynumber1,'Color', textColor,...
                                    'FontSize', 18, 'Location', textLocation1); 
textInserter2 = vision.TextInserter(Querynumber2,'Color', textColor,...
                                    'FontSize', 18, 'Location', textLocation2);
textInserter3 = vision.TextInserter(Querynumber3,'Color', textColor,...
                                    'FontSize', 18, 'Location', textLocation3);
textInserter4 = vision.TextInserter(Querynumber4,'Color', textColor,...
                                    'FontSize', 18, 'Location', textLocation4);                                
textInserter5 = vision.TextInserter(Querynumber5,'Color', textColor,...
                                     'FontSize', 18, 'Location', textLocation5);                                
textInserter6 = vision.TextInserter(Querynumber6,'Color', textColor,...
                                    'FontSize', 2, 'Location', textLocation6); 
   %insert the text 
YCBCR=step(textInserter1,YCBCR);
YCBCR=step(textInserter2,YCBCR);
YCBCR=step(textInserter3,YCBCR);
YCBCR=step(textInserter4,YCBCR);
YCBCR=step(textInserter5,YCBCR);
YCBCR=step(textInserter6,YCBCR);

F=YCBCR;         %Retrun the image with the text 
end