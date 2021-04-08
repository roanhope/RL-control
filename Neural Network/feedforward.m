clc;
close all;
clear variables;
%%
[x,t] = simplefit_dataset;
figure
plot(x, t)
hold on;

net = feedforwardnet(10);

tic
net = train(net,x,t);
toc

y = net(x);
plot(x, y, 'r')
perf = perform(net,y,t)
% net.adapt
