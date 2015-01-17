%Rewritten program for HPB
close;
clear all;
clc;

disp('IMAGING SIMULATOR by Kees Kroep');
%Initialize and process given values and parameters

S_Resolution = 1E-3; %distance between voxels
S_Start = [0,0,0]; % the s  tartlocation of the sourcespace
S_Directions = [32,32,32];
V_Slices = [1,3,5,7]; % four slices out of the measured data
%frequency = 50000; % hz, we currenlt0y only use one frequency
frequency2 = [10000, 50000, 70000];
new_Source_3D = zeros(S_Directions(1),S_Directions(2),S_Directions(3));

c = 320; %speed of sound 

%Initialize position of receivers transmitters and the source space
[ Receiver_locs, Transmitter_locs] = Transducer_Init(S_Resolution);
fprintf('\tTransducer_Init DONE\n\n');


disp('Frequency_Loop STARTED');
for frequency = frequency2
    
fprintf('NEW LOOP Frequency =%d\n\n',frequency);
fprintf('\tcalculate_A \t\tSTARTED');
tic;
%Calculate the A_matrix. This matrix is used for both the forward and
%inverse calculations.
[ A_Matrix ] = calculate_A( Receiver_locs, S_Directions, S_Resolution, S_Start, c, frequency);
fprintf('\tDONE\n\t');
toc;


%Next up, the Source needs to be filled with data.
[ Source ] = Fill_Source( S_Directions, Transmitter_locs);
fprintf('\tFill_Source \t\tSTARTED\tDONE\n');



fprintf('\tForward Function \tSTARTED');
%Calculate the input of the receivers with a forward function
Data = A_Matrix*Source;

fprintf('\tDONE\n');

fprintf('\tInverse Function \tSTARTED');
%recalculate the source with use of the inverse function
%the inverse of the forward function uses a hermitian operator
new_Source = A_Matrix'*Data;

fprintf('\tDONE\n');

fprintf('\tVisualization \t\tSTARTED');
%Visualize the calculated data


for x=1:S_Directions(1)
    for y=1:S_Directions(2)
        for z=1:S_Directions(3)
            new_Source_3D(x,y,z) = new_Source_3D(x,y,z) + new_Source(T3Dto1D(x, y, z, S_Directions(1),S_Directions(2)));
        end
    end
end

fprintf('\tDONE\n\n')
%Here ends the frequency loop
end


disp('Frequency_Loop DONE');

%Weghalen van nutteloze variabelen uit de workspace voor een cleanere
%representatie
varlist1 = {'x','y','z', 'varlist1'};
clear(varlist1{:}); 
%varlist2 = {'Receiver_locs','S_Resolution', 'Transmitter_locs',...
%            'frequency', 'c', 'S_Start', 'S_dimensions', 'varlist2'};
%clear(varlist2{:});




%Visualization: 4 slices in black and white
% subplot(2,2,1);
% caxis([0 20000]);
% imagesc(real(new_Source_3D(:,:,V_Slices(1))));
% xlabel(['z=' num2str(V_Slices(1))]);
% 
% subplot(2,2,2);
% caxis([0 20000]);
% imagesc(real(new_Source_3D(:,:,V_Slices(2))));
% xlabel(['z=' num2str(V_Slices(2))]);
% 
% subplot(2,2,3);
% caxis([0 20000]);
% imagesc(real(new_Source_3D(:,:,V_Slices(3))));
% xlabel(['z=' num2str(V_Slices(3))]);
% 
% subplot(2,2,4);
% caxis([0 20000]);
% imagesc(real(new_Source_3D(:,:,V_Slices(4))));
% xlabel(['z=' num2str(V_Slices(4))]);

% colormap(gray);
% disp('Imaging DONE');




disp('TODOLIST:');

fprintf('-\tMeer transmitters\n');
fprintf('-\treceivers op een bol gooien\n');
fprintf('-\truis op data (experiementeren)\n');
fprintf('-\thet transducer inlaadsysteem is momenteel niet elegant\n');
fprintf('-\tComplexere afbeeldingen\n');
fprintf('-\tMeshgrid voor snelheid calculate_a\n');
fprintf('-\tEventueel calculate_A in C\n');


for i=1:size(Transmitter_locs,1)
transmitter_string{i} = strcat('[',num2str(Transmitter_locs(i,1)), ',', num2str(Transmitter_locs(i,2)), ',', num2str(Transmitter_locs(i,3)),']');
end

whos; %View workspace
Imaging_GUI(new_Source_3D.^2, S_Directions, transmitter_string);
