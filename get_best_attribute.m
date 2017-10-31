% This function will select an attribute of a set that will give the most
% information gain if selected as the next branch of the tree.
function attribute = get_best_attribute(attributes_left, set)
        max_gain = 0;
        attribute = 0;
        for i = attributes_left
            gain_i = gain(set, i);
           
            if (gain_i > max_gain)
                max_gain = gain_i;
                attribute = i;
            end
        end
        
        if (size(attributes_left,2) == 0)
            return;
        end
        
        if (attribute == 0)
           attribute = attributes_left(1);
        end
    end