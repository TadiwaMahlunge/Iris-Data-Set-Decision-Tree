
%This function will return all the elements of a set whose values in a given column fall within the
%bounds (x,y] of a given column in the set.
function elements = elements_of_value(x, y, set ,column)
        count = 0;
        for i = 1:size(set,1)
            if((set(i,column) <= y) &&  (set(i,column) > x))
                count = count+1;
            end
        end
        elements = zeros(count, size(set,2));
        
        elements_counter = 1;
        for i = 1:size(set,1)
            if((set(i,column) <= y) &&  (set(i,column) > x))
                for g = 1:size(set,2)
                    elements(elements_counter,g) = set(i,g);
                end
                elements_counter = elements_counter + 1;
            end
        end
end