clc;clear all;close all;

% Read Data from Excel file
file = 'irisdata.xlsx'; 
[~,~,rawdata] = xlsread(file,1); % Read from first spreadsheet 
[~,~,testdata] = xlsread(file,2); 
input = cell2mat(rawdata(:,1:4)); 
output = cell2mat(rawdata(:,5)); 
test = cell2mat(testdata(:,1:4)); 
test_out = cell2mat(testdata(:,5));

% Change rows into columns (Transpose) 
input = input';
output = output';
test = test'; 
test_out = test_out';
%%
nntool
%%
load('TrainingCases.mat')
%%
close all;
% Simulating the Trained Network
testres = sim(Case10,test); 
testres = round(testres); 
results = testres == test_out;

% Check Differences between Trained Output and Original Output
figure('Name','Output Comparison') 
hold on 
plot(test_out,'b'); 
plot(testres,'r-*');
% Cleaning up graph presentation 
axis([1 15 0 4]) 
set(gca,'YTick',[1 2 3]); 
set(gca,'YTickLabel',['iris-seto';'iris-vers';'iris-virg']) 
set(gca,'XTick',[1:15]);
xlabel('Sample No.'); 
ylabel ('Iris Species'); 
legend('Actual Result','Trained Result')
