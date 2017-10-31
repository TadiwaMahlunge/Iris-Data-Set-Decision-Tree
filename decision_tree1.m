%A private study decision tree I created to fully understand the algorithm.
%Data courtesy of wikipedia : https://en.wikipedia.org/wiki/Iris_flower_data_set

iris_data = csvread('iris_data_25x3_train.txt');
num_attributes = size(iris_data,2)-1;
attributes_left = 1:num_attributes;
num_elements = size(iris_data,1);

attribute = get_best_attribute(attributes_left, iris_data);

node_path = [];

classifier = split (iris_data, attributes_left,attribute, node_path);
%Remove the '%' if one wants to see the classifier.
%display(classifier);

accuracy_training_set = test_classifier(classifier, iris_data, attribute);
display(accuracy_training_set);

test_data = csvread('iris_data_25x3_test.txt');
accuracy_test_set = test_classifier(classifier, test_data, attribute);
display(accuracy_test_set);


test_data150 = csvread('iris_data_150samples.txt');
accuracy_test_set_150 = test_classifier(classifier, test_data150, attribute);
display(accuracy_test_set_150);
