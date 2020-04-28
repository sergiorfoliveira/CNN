%% CNN.m
% Implements a Convolutional Neural Network from scratch and uses the
%   CIFAR-10 dataset to train and test it.
% Author: sergio.r.f.oliveira@ieee.org
% Based on the algorithm described at: 
%   http://victorzhou.com/blog/intro-to-cnns-part-2/
% The CIFAR-10 datasets can be downloaded from:
%   https://www.cs.toronto.edu/~kriz/cifar.html
% MIT license applies - please cite the sources.

%% Initialize:
clear variables;
clc
LR = 0.05; % Learning ratio
F = 10; % Number of filters
FS = 3; % Filter size: 3x3
W = 10; % Number of weights: 10
WS = 15; % Weight size: 15x15
%rng(17); % Random Number Generator Seed
LastData.Weights = randn(WS*WS*F,W)/(WS*WS*F);
LastData.Filters = randn(F,FS,FS)/(FS*FS);
LastData.Biases = zeros(W,1);
         
%% Train:
Folder ='C:\Matlab\cifar-10-batches-mat\';
Files = {'data_batch_1.mat','data_batch_2.mat','data_batch_3.mat',...
         'data_batch_4.mat','data_batch_5.mat'};
[~,T] = size(Files);
A=0;
B=0;
Perm1 = randperm(T);
tic
for t=1:T
    FQFN =  strcat(Folder,Files{Perm1(t)});
    [Images,Labels] = ReadCIFAR10file(FQFN);
    [N,L,C] = size(Images);
    Perm2 = randperm(N);
    for n=1:N
        Img(1:L,1:C) = Images(Perm2(n),1:L,1:C);
        [Loss,Acc,LastData] = Train(Img,Labels(Perm2(n)),LastData,LR);
        A=A+Acc;
        B=B+1;
        disp(A/B);
    end
end
toc

%% Test:
Folder ='C:\Matlab\cifar-10-batches-mat\';
Files = {'test_batch.mat'};
[~,T] = size(Files);
A=0;
B=0;
tic
for t=1:T
    FQFN = strcat(Folder,Files{t});
    [Images,Labels] = ReadCIFAR10file(FQFN);
    [N,~,~] = size(Images);
    for n=1:N
        Img(1:L,1:C) = Images(n,1:L,1:C);
        [Acc, Loss] = Forward(Img, Labels(n), LastData);
        A=A+Acc;
        B=B+1;
        disp(A/B);    
    end
end
toc