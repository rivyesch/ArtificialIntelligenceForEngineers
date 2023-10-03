%Name: Rivyesch Ranjan
%ID: 29392004
%Date: 17/03/2021

%Tidying up the workplace
clc;
clear all;
close all;

%Importing the relevant data from the data sheet provided
chicago_Ohare='data_Chicago1989.xlsx'; %Importing data from the excel file
Dry_Bulb_Temp = xlsread(chicago_Ohare,'A:A');
Dew_Point_Temp = xlsread(chicago_Ohare,'B:B');
Relative_Humidity=xlsread(chicago_Ohare,'C:C');

%% Developing a Fuzzy Logic Controller for Weather Prediction (Case A)
% input 1 : Dew Point Temperature
% input 2 : Dry Bulb Temperature
% output : relative humidity

fuzzy_set_A= readfis('Lab1_rev11.fis');

%Using fuzzy logic to simulate data
Output_A=evalfis([Dew_Point_Temp Dry_Bulb_Temp],fuzzy_set_A);
deviation_A=abs(Output_A-Relative_Humidity);
max_deviation_A=max(deviation_A);
error_A= deviation_A./Relative_Humidity*100;
min_error_A=min(error_A)
max_error_A=max(error_A)
average_error_A=mean(error_A)

%Graph plotted to compare Actual and Simulated Relative Humidity
figure(1)
plot(1:length(Relative_Humidity),Relative_Humidity,'b',1:length(Relative_Humidity),Output_A,'r*-')
title('Comparison of Simulated and Actual Relative Humidity')
xlabel('Data Points')
ylabel('Relative Humidity')
legend('Actual Relative Humidity','Simulated Relative Humidity')
%Graph plotted for percentage error and mean error
figure(2)
plot(1:length(Relative_Humidity),error_A,'g', [1,length(Relative_Humidity)], [average_error_A,average_error_A], 'r')
title('Error Percentage')
xlabel('Data Points')
ylabel('Error Percentage of RelativeHumidity')
legend ('Percentage Error', 'Mean Error')


%% Developing a Fuzzy Logic Controller for Weather Prediction (Case B)
% input 1 : Relative Humidity
% input 2 : Dry Bulb Temperature
% output : Dew Point Temperature

fuzzy_set_B= readfis('Lab1_rev23.fis');

%Using fuzzy logic to simulate data
Output_B=evalfis([Relative_Humidity Dry_Bulb_Temp],fuzzy_set_B);
deviation_B=abs(Output_B-Dew_Point_Temp);
max_deviation_A=max(deviation_B);
error_B= deviation_B./Dew_Point_Temp*100;
min_error_B=min(error_B)
max_error_B=max(error_B)
average_error_B=mean(error_B)

%Graph plotted to compare Actual and Simulated Dew Point Temperature
figure(3)
plot(1:length(Dew_Point_Temp),Dew_Point_Temp,'b',1:length(Dew_Point_Temp),Output_B,'r*-')
title('Comparison of Simulated and Actual Dew Point Temperature')
xlabel('Data Points')
ylabel('Dew Point Temperature')
legend('Actual Dew Point Temperature','Simulated Dew Point Temperature')
%Graph plotted for percentage error and mean error
figure(4)
plot(1:length(Dew_Point_Temp),error_B,'g', [1,length(Dew_Point_Temp)], [average_error_B,average_error_B], 'r')
title('Error Percentage')
xlabel('Data Points')
ylabel('Error Percentage of Dew Point Temperature')
legend ('Percentage Error', 'Mean Error')
