%Main Fiule for HPB Ultrasound
%Simple Imaging program
%By: Kees Kroep

%% Initialization
clear all;
clc;
clf;
close;

Transmitter_Loc = [2,1,0];
Receiver_Loc = [1,1,0; 1,2,0; 1,3,0; 1,4,0; 1,5,0; 1,6,0; 1,7,0; 1,8,0; 1,9,0];
Projection_Coordinates = [5,0,-2;5,10,-2;5,10,2]; %First left up, then left down, then right down


Start_point = [0,0,0];
x = 10;
y = 10;
z = 10;

frequentie = 4000; %frequentie vast op 4 KHz

Pixel_Matrix = zeros(x,y,z);
Source = Initialization( Start_point, x, y, z);


disp ('Initialization DONE');
%% Forward (calculate what is measured by the transducers)
Receiver_Data = Forward_Function( Transmitter_Loc, Receiver_Loc, frequentie, Source);

disp ('Forward function DONE');

%% Invserse (Reconstruct the image)
Pixel_Matrix = Inverse_Function( Receiver_Loc, Receiver_Data, Pixel_Matrix, frequentie, Projection_Coordinates);


disp ('Inverse function DONE');

% Visualizer = Pixel_Matrix;
% for i =1:size(Transmitter_Loc,1)
%     Visualizer(Transmitter_Loc(i,2),Transmitter_Loc(i,1)) = 1;
% end
% 
% for i =1:size(Receiver_Loc,1)
%     Visualizer(Receiver_Loc(i,2),Receiver_Loc(i,1)) = 1;
% end
% 
% Visualizer=flipud(Visualizer);

%% Make Image

figure(1)
%F =  1:Sample_Length;
% subplot(4,1,1);
% imagesc(imag(Receiver_Data(1,:)));
% %plot(F,abs(Receiver_Data(1,:)));
% subplot(4,1,2);
% imagesc(imag(Receiver_Data(2,:)));
% 
% subplot(4,1,3);
% imagesc(imag(Receiver_Data(3,:)));
% 
% subplot(4,1,4);
% imagesc(imag(Receiver_Data(4,:)));

imagesc(real(Pixel_Matrix));
colormap(gray);


%%