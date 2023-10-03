clear all; close all; clc;

num0_1 = [1 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1];
num0_2 = randNoise(num0_1);
num0_3 = randNoise(num0_1);
num0_4 = randNoise(num0_1);
num0_5 = randNoise(num0_1);

num2_1 = [0 1 1 1 1 1 1 0; 0 1 1 1 1 1 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 0 0 0 0 0 1 1 0; 0 0 0 1 1 1 1 0; 0 1 1 1 1 0 0 0; 1 1 1 0 0 0 0 0; 1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1];
num2_2 = randNoise(num2_1);
num2_3 = randNoise(num2_1);
num2_4 = randNoise(num2_1);
num2_5 = randNoise(num2_1);

num3_1 = [0 1 1 1 1 1 1 0; 0 1 1 1 1 1 1 1; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 0 0 0 0 1 1 1 0; 0 0 0 0 1 1 1 0; 1 1 0 0 0 0 1 1; 1 1 0 0 0 0 1 1; 0 1 1 1 1 1 1 1; 0 1 1 1 1 1 1 0];
num3_2 = randNoise(num3_1);
num3_3 = randNoise(num3_1);
num3_4 = randNoise(num3_1);
num3_5 = randNoise(num3_1);

num4_1 = [0 0 0 0 1 1 1 0; 0 0 0 1 1 1 1 0; 0 0 1 1 1 1 1 0; 0 0 1 1 0 1 1 0; 0 1 1 0 0 1 1 0; 1 1 1 0 0 1 1 0; 1 1 0 0 0 1 1 0; 1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1; 0 0 0 0 0 1 1 0];
num4_2 = randNoise(num4_1);
num4_3 = randNoise(num4_1);
num4_4 = randNoise(num4_1);
num4_5 = randNoise(num4_1);

E_1 = [1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1; 1 1 0 0 0 0 0 0; 1 1 0 0 0 0 0 0; 1 1 1 1 1 1 1 0; 1 1 1 1 1 1 1 0; 1 1 0 0 0 0 0 0; 1 1 0 0 0 0 0 0; 1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1];
E_2 = randNoise(E_1);
E_3 = randNoise(E_1);
E_4 = randNoise(E_1);
E_5 = randNoise(E_1);

H_1 = [1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1; 1,1,1,1,1,1,1,1; 1,1,1,1,1,1,1,1; 1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1; 1,1,0,0,0,0,1,1;];
H_2 = randNoise(H_1);
H_3 = randNoise(H_1);
H_4 = randNoise(H_1);
H_5 = randNoise(H_1);

I_1 = [1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1; 0 0 0 1 1 0 0 0; 0 0 0 1 1 0 0 0; 0 0 0 1 1 0 0 0; 0 0 0 1 1 0 0 0; 0 0 0 1 1 0 0 0; 0 0 0 1 1 0 0 0; 1 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 1];
I_2 = randNoise(I_1);
I_3 = randNoise(I_1);
I_4 = randNoise(I_1);
I_5 = randNoise(I_1);

S_1 = [1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1;1,1,0,0,0,0,0,0;1,1,0,0,0,0,0,0;1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1;0,0,0,0,0,0,1,1;0,0,0,0,0,0,1,1;1,1,1,1,1,1,1,1;1,1,1,1,1,1,1,1];
S_2 = randNoise(S_1);
S_3 = randNoise(S_1);
S_4 = randNoise(S_1);
S_5 = randNoise(S_1);

V_1 = [0 0 0 0 0 0 0 0; 1 0 0 0 0 0 0 1; 1 0 0 0 0 0 0 1; 1 0 0 0 0 0 0 1; 1 1 0 0 0 0 1 1; 0 1 0 0 0 0 1 0; 0 1 1 0 0 1 1 0; 0 0 1 0 0 1 0 0; 0 0 1 1 1 1 0 0; 0 0 0 1 1 0 0 0];
V_2 = randNoise(V_1);
V_3 = randNoise(V_1);
V_4 = randNoise(V_1);
V_5 = randNoise(V_1);

Y_1 = [1,0,0,0,0,0,0,1; 1,0,0,0,0,0,0,1; 1,1,0,0,0,0,1,1; 0,1,1,0,0,1,1,0; 0,0,1,1,1,1,0,0; 0,0,0,1,1,0,0,0; 0,0,0,1,1,0,0,0; 0,0,0,1,1,0,0,0; 0,0,0,1,1,0,0,0; 0,0,0,1,1,0,0,0];
Y_2 = randNoise(Y_1);
Y_3 = randNoise(Y_1);
Y_4 = randNoise(Y_1);
Y_5 = randNoise(Y_1);


char_cell = {num0_1,num0_2,num0_3,num0_4,num0_5,num2_1,num2_2,num2_3,num2_4,num2_5,num3_1,num3_2,num3_3,num3_4,num3_5,num4_1,num4_2,num4_3,num4_4,num4_5,E_1,E_2,E_3,E_4,E_5,H_1,H_2,H_3,H_4,H_5,I_1,I_2,I_3,I_4,I_5,S_1,S_2,S_3,S_4,S_5,V_1,V_2,V_3,V_4,V_5,Y_1,Y_2,Y_3,Y_4,Y_5};
% Plotting images
figure('name','Input Images')
for i = 1:50
    subplot(10,5,i),imshow(char_cell{i},'InitialMagnification','fit'),axis square;
end

save('lab3workspacetest.mat')