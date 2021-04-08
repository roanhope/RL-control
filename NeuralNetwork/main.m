clc;
close all;
clear variables;
%%
num = 500;
class1 = randn(num, 2) + [1, 4];
class2 = randn(num, 2) + [0, 0];

figure
axis equal
plot(class1(:, 1), class1(:, 2), 'bo')
hold on;
plot(class2(:, 1), class2(:, 2), 'ro')


train_set_num = round(0.7 * num);
train_set = [class1(1:train_set_num, :); class2(1:train_set_num, :)];
train_labels = [zeros(length(class1(1:train_set_num, :)), 1); ones(length(class2(1:train_set_num, :)), 1)];
[train_set, train_labels] = shuffle(train_set, train_labels);

test_set = [class1(train_set_num + 1:end, :); class2(train_set_num + 1:end, :)];
test_labels = [zeros(length(class1(train_set_num + 1:end, :)), 1); ones(length(class2(1:train_set_num, :)), 1)];


figure
axis equal
plot(train_set(:, 1), train_set(:, 2), 'mo')

layers = [ ...
    imageInputLayer([2 1])
    fullyConnectedLayer(10)
    reluLayer
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer
];

options = trainingOptions('adam', ...
    'MaxEpochs',20,...
    'InitialLearnRate',1e-3, ...
    'Verbose',false, ...
    'Plots','training-progress');

categ = categorical(train_labels);
net = trainNetwork(train_set,categ, layers,options);


function [set_out, labels_out] = shuffle(set, labels)
    perm = randperm(length(set));
    set_out=set(perm, :);
    labels_out = labels(perm, :);
 end
