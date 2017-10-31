% This is my interpretation of the basic split function. It returns a
% classification table in form:
% [branching column, lower bound, upper bound, class]. To avoid overfitting
% I only use three of the four quartiles.
function total_classifier = split (set, attributes_left, attribute , nodes)
    
    total_classifier = [];

    if (size(attributes_left,2)== 0 || attribute == 0)
        display(set);
        display(attributes_left);
        display(attribute);
        return;
    end
    
    values = [quantile(set(:,attribute),[0.5 0.75]) , max(set(:,attribute))];

    function truth = check_set()
       truth = true;
       num_cols = size(set,2);
       if (size(set,1) == 1)
               return;
       end
       
       for j = 1 : size(set,1)
           if ((j > 1) && (set(j,num_cols) ~= set(j-1,num_cols)))
               truth = false;
               break;
           end
       end
    end
    
    if (check_set ~= true)
        for n = 1:size(values,2)
            if (n == 1)
                subset = elements_of_value(0,values(1),set, attribute);
                selected_bounds = [0 values(1)];
            else
                subset = elements_of_value(values(n-1),values(n),set, attribute);
                selected_bounds = [values(n-1) values(n)];
            end 
           
            subset_attributes_left = attributes_left;
            
            subset_attribute = get_best_attribute(subset_attributes_left, subset);
            
            node_path = [nodes; [attribute, selected_bounds]]; 
            
            total_classifier = [total_classifier; split(subset, subset_attributes_left , subset_attribute, node_path)];   
            
        end
        
    else
        if (size(set,1) == 0)
            return;
        else
            class(1:(size(nodes,1))) = set(1,size(set,2));
            classes = transpose(class);
            total_classifier = [nodes classes];
        end
    end
end




