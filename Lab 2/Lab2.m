% Name: Rivyesch Ranjan
% ID: 29392004
% Date Modified: 31/03/2021

clc;clear all;close all;
%% Loading Fingerprint Images
pic1 = imread('leftthumb.png'); 
pic2 = imread('rightthumb.png');

%% Convert Images to Black and White
bw1 = im2bw(pic1,0.5);
bw2 = im2bw(pic2,0.5);
figure('Name','Fingerprint Images after Thresholding')
subplot(1,2,1),imshow(bw1,'InitialMagnification','fit'),axis square;
subplot(1,2,2),imshow(bw2,'InitialMagnification','fit'),axis square;
% Image size (For resizing purpose)
imrow = 192;
imcol = 112;

%% Create Duplicate of Specified Regions with Randomised Pixels
if exist('FingerprintSamples.mat','file') 
    fprintf('The Variables Exist. Loading...\n'); 
    load('FingerprintSamples.mat'); 
else fprintf('Variables Do Not Exist. Creating Variables...\n'); 
    N = 100; % Number of pixels to be inverted

    % Fingerprint 1 
    f11_og = bw1; % Original Fingerprint 
    f11_resize = imresize(f11_og,[imrow,imcol]); 
    f11 = f11_resize((96:116),(56:76)); 
    f12 = AddNoise(f11,N); 
    f13 = AddNoise(f11,N); 
    f14 = AddNoise(f11,N); 
    f15 = AddNoise(f11,N); 
    % Fingerprint 2 
    f21_og = bw2; % Original Fingerprint 
    f21_resize = imresize(f21_og,[imrow,imcol]); 
    f21 = f21_resize((96:116),(56:76)); 
    f22 = AddNoise(f21,N); 
    f23 = AddNoise(f21,N); 
    f24 = AddNoise(f21,N); 
    f25 = AddNoise(f21,N);
    
    save('FingerprintSamples.mat','f11','f12','f13','f14','f15','f21','f22','f23','f24','f25'); 
    % Save variables for future training usage 
end

%% Plot Fingerprint Images
figure('name','Input Images') 
subplot(2,5,1),imshow(f11,'InitialMagnification','fit'),axis square; 
subplot(2,5,2),imshow(f12,'InitialMagnification','fit'),axis square; 
subplot(2,5,3),imshow(f13,'InitialMagnification','fit'),axis square; 
subplot(2,5,4),imshow(f14,'InitialMagnification','fit'),axis square; 
subplot(2,5,5),imshow(f15,'InitialMagnification','fit'),axis square; 
subplot(2,5,6),imshow(f21,'InitialMagnification','fit'),axis square; 
subplot(2,5,7),imshow(f22,'InitialMagnification','fit'),axis square; 
subplot(2,5,8),imshow(f23,'InitialMagnification','fit'),axis square; 
subplot(2,5,9),imshow(f24,'InitialMagnification','fit'),axis square; 
subplot(2,5,10),imshow(f25,'InitialMagnification','fit'),axis square;

%% Prepare Input for Training
biometric_in = [reshape(f11,1,[]);reshape(f12,1,[]);reshape(f13,1,[]);reshape(f14,1,[]);reshape(f15,1,[]); 
reshape(f21,1,[]);reshape(f22,1,[]);reshape(f23,1,[]);reshape(f24,1,[]);reshape(f25,1,[])]; 
traininput = biometric_in'; 
figure('Name','Training Input') 
imagesc(traininput)

%% ANN Target
figure('Name','Target Output')
target = zeros(2,10); 
target(1,1:5) = 1; 
target(2,6:10) = 1; 
imshow(target,'InitialMagnification','fit');

%% Train Network
train1 = newff( traininput, target, [25,25], {'tansig','tansig', 'tansig'}, 'trainscg' ); 
train1.trainParam.show = 100; 
train1.trainParam.epochs = 1000; % Number of epochs 
train1.trainParam.lr = 0.08; % Learning Rate 
train1.trainParam.goal = 0; % Goal 
[net_out,train_rec,train_out,nn_err] = train(train1,traininput,target);

%% Simulate Output
NN_Out = sim(net_out,traininput); 
NN_Out_round = round(SCG_logsig_sim); 
figure('name','Neural Network Output') 
imshow(SCG_logsig_sim,'InitialMagnification','fit') 
figure('name','NN Output(Rounded)') 
imshow(NN_Out_round,'InitialMagnification','fit')
