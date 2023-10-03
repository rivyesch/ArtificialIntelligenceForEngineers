%% Testing output of system on different inputs
clc; clear; close all;

load lab3nn_optimised.mat
%%
% Loading input data from character generation code
load lab3workspacetest.mat

% Plotting images from code
figure('name','Input Images')
for i = 1:50
    subplot(10,5,i),imshow(char_cell{i},'InitialMagnification','fit'),axis square;
    %set(gca,'Color','k')
    box on
end
%set(gca,'Color','k')
%%
% Plotting train target
figure('name','Train Target for 10 Characters')
imshow(traintarget,'InitialMagnification','fit');


% Generating and preparing test inputs
testchar1 = reshape(H_2,1,80);
testchar2 = reshape(num2_4,1,80);
testinput1 = testchar1';
testinput2 = testchar2';

% Plotting test inputs
figure('name','Test input with different noise for character H')
imshow(~H_2,'InitialMagnification','fit'); axis square;
figure('name','Test input with different noise for number 2')
imshow(~num2_4,'InitialMagnification','fit'); axis square;
%%
% Testing inputs with neural network and plotting system outputs
NN_Outlm = sim(net_out, testinput1);
NN_Outlm = round(NN_Outlm);
figure();
imshow(NN_Outlm)

NN_Outlm = sim(net_out, testinput2);
NN_Outlm = round(NN_Outlm);
figure();
imshow(NN_Outlm)