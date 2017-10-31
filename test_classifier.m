% This function will test the accuracy of a classifier by checking whether
% or not it correctly classifies every element of a set. I wish I knew how
% to make this faster than brute force however, I can't see a way to check
% every row of the set without brute force being used.
function accuracy = test_classifier(classifier, set, first_attribute)
    classifier_length = size(classifier,1);
    accuracy_count = 0;
    
    max_set_vector = zeros(1,4);
    max_classifier_vector = zeros(2,4);
    
    for q = 1:4
       max_set_vector(q) = max(set(:,q)); 
    end

    
    for p = 1:4
        for t = 1:size(classifier,1)
            if ((classifier (t,1) == p) && (classifier (t,3) > max_classifier_vector(1,p))) 
                max_classifier_vector(1,p) = classifier (t,3);
                max_classifier_vector(2,p) = t;
            end
        end
    end
    
    for f = 1:4
        classifier(max_classifier_vector(2,f),3) = max_set_vector(f);
    end

        
        for s = 1:size(set,1)
            classified = false;
            i = 1; 
            while (i <= classifier_length && classified == false)
                current_classifier = classifier(i,:);
                i = i+1;
                
                while((i <= classifier_length) && (classifier(i,1) ~= first_attribute))
                    current_classifier = [current_classifier; classifier(i,:)];
                i=i+1;
                end
                
                for n = 1:size(current_classifier,1)
                    if(~((set(s,current_classifier(n,1)) >= current_classifier(n,2)) && (set(s,current_classifier(n,1)) <= current_classifier(n,3))))
                        break;
                    end
                    if (set(s,size(set,2)) == current_classifier(n,4)&&(n == size(current_classifier,1)) && (set(s,current_classifier(n,1)) >= current_classifier(n,2)) && (set(s,current_classifier(n,1)) <= current_classifier(n,3)))
                        accuracy_count = accuracy_count+1;
                        classified = true;
                    end
                end 
           end
        end
    
    accuracy = accuracy_count/size(set,1);
end