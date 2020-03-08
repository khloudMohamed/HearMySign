function F=Find_Max_Element(vector)
     MAX=max(vector);
     for i=1:length(vector)
         if (vector(i)==MAX)
             F=i;
             break;
         end
     end
end