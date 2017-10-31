% This function will return the information gain for selecting a given
% column of a set for the next decision tree branch.
function information_gain = gain(set, column)
    
    values = quantile(set(:,column),[0.5 0.75 1]);
    information_gain = entropy(set, column, values);
    
    for n = 1:size(values,2)
        if (n == 1)
            elements = elements_of_value(0,values(1),set, column);
        else
            elements = elements_of_value(values(n-1),values(n),set, column);
        end 
        
        if (size(elements,1) ~=0)
            scalar = size(elements,1)/size(set,1);
            information_gain = information_gain - (scalar*entropy(elements, column, values));
        end
    end
    
end