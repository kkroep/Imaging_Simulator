%Main Fiule for HPB Ultrasound
%Simple Imaging program
%By: Kees Kroep

%% Initialization
clear all;
clc;
clf;
close;

Transmitter_Loc = [5,5];
Receiver_Loc = [1,1; 1,3; 1,6; 1,13];

Screen_Heigth = 20;
Screen_Width = 30;
Sample_Length = 1000;
Min_freq = 2000;
Max_freq = 10000;

Pixel_Matrix = zeros(Screen_Heigth,Screen_Width);


%% Forward (calculate what is measured by the transducers)
Receiver_Data = Forward_Function( Transmitter_Loc, Receiver_Loc, Sample_Length, Min_freq, Max_freq);



%% Invserse (Reconstruct the image)
Pixel_Matrix = Inverse_Function( Receiver_Loc, Receiver_Data, Pixel_Matrix, Sample_Length, Min_freq, Max_freq);

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
F =  1:Sample_Length

figure(1)
subplot(4,1,1);
imagesc(abs(Receiver_Data(1,:)));
%plot(F,abs(Receiver_Data(1,:)));
subplot(4,1,2);
imagesc(abs(Receiver_Data(2,:)));

subplot(4,1,3);
imagesc(abs(Receiver_Data(3,:)));

subplot(4,1,4);
imagesc(abs(Receiver_Data(4,:)));
colormap(gray);


%%