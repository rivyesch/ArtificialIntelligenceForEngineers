 %% Training and validating neural network

clc; clear; close all;

% Loading input data from character generation code
load lab3workspace.mat

% Plotting images from code
figure('name','Input Images')
for i = 1:50
    subplot(10,5,i),imshow(char_cell{i},'InitialMagnification','fit'),axis square;
end
%%
% Generating training input data
inputchar = zeros(50,80); %10 rows for 10 different characters and 50 columns for 50 different inputs
for i = 1:50
    inputchar(i,:) = reshape(char_cell{i},1, []);
end
traininput = inputchar';
figure();
imagesc(traininput)
%%
% Generating training target data
traintarget = zeros(10,50); %since 10 characters (rows) and each character has 5 samples (column)
for i = 1:10
    traintarget(i,1+5*(i-1):5*i) = 1;
end

% Plotting train target
figure('name','Train Target for 10 Characters')
imshow(traintarget,'InitialMagnification','fit');
%%
% Creating a loop to run the training multiple times and find the total
% number of error pixels and time taken
totalerror = 0;
tic

    % Generating neural network and training
    train1 = newff( traininput, traintarget, [20,20], {'tansig','logsig','tansig'}, 'trainlm' );
    
    
    % Setting training parameters
    train1.trainParam.show = 100;
    train1.trainParam.epochs = 200;
    train1.trainParam.lr = 0.1;
    train1.trainParam.goal = 1e-9;
    
    % Training neural network and saving
    [net_out,train_rec,train_out,nn_err] = train(train1,traininput,traintarget);
    
    % Testing training output of netural network
    NN_Out = sim(net_out,traininput);
    figure('name','NN Output Unrounded')
    imshow(NN_Out, 'InitialMagnification', 'fit')
    NN_Out_round = round(NN_Out);
    figure('name','NN Output Rounded')
    imshow(NN_Out_round, 'InitialMagnification', 'fit')
    
    % Output number of errors
    negative = find(NN_Out_round<0);
    NN_Out_round(negative) = 0;
    difference = abs(traintarget-NN_Out_round);
    sumdiff = sum(sum(difference));
    totalerror = totalerror + sumdiff;
    
toc
%%
save tansiglogsigtansig_tf.mat