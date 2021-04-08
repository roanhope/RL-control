clc;
close all;
clear variables;

%%
m = 100;
x = linspace(0, 10, m);
y = x * 0.4 - 3  + randn(1, m)*0.8;
figure
hold on
plot(x, y)

%% perceptron
n = 1;

TH = randn(n + 1, 1);
X = [ones(1, length(x)); x];


alpha = 0.01;
epochs = 1000;
J_val = zeros(epochs, 1);
for epoch = 1:epochs
    J_val(epoch) = J(X, TH, y);
    TH = TH - alpha * dJdTH(X, TH, y);
end
% TH = (X*X')^(-1)*X*y';
syms xsym
fplot(h([1;xsym], TH), [0, 10])

figure
plot(1:epochs, J_val);

function ret = h(X, TH)
    ret = TH' * X;
end

function ret = J(X, TH, Y)
    H = h(X, TH);
    ret = 1 / 2 / length(Y) * (H - Y) * (H - Y)';
end

function ret = dJdTH(X, TH, Y)
    ret = X * (h(X, TH) - Y)' / length(Y);
end