
%This function will calculate the entropy of a set's values within a given
%column. It does so using the empirical probabilities derived from the
%set's data.
function set_entropy = entropy(set, column, values)

    set_size = size(set,1);
    set_entropy = 0;
    
    function p = prob(lower, upper)
       p_count = 0;
       col = set(:,column);
       
       for v = 1:size(col)
          if ((col(v,1) <= upper) && (col(v,1) >= lower));
              p_count = p_count + 1;
          end
       end
       p = p_count/set_size;
    end

    for n = 1:size(values,2)
        if (n == 1)
             p = prob(0, values(1));
        else
             p = prob(values(n-1) ,values(n));
        end 
        
        if( p > 1)
           p = 1; 
        end
        
        if (p ~= 0)
           set_entropy = set_entropy - (p*log2(p)); 
        end
    end
end
