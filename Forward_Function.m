function [ A, Receiver_Data ] = Forward_Function( Transmitter_Loc, Receiver_Loc, frequentie, Source, x, y, z)
%This function calculates the measured data of the transducers
%By; Kees KRoep

%As of now there is one point source

%in the frequency domain. the pressure of eachb receiver is calculated
%using the distance between transmitter and receiver, and the velocity.

%Allocate data and set to zero

%------------------------------------------------------
%Stappenplan: 
% -Maak eerst een Source vector aan: de te meten ruimte
%     -NOTE: dit moet een vector met 1 dimensie zijn!!!
% -Maak de A matrix. Deze wordt voortaan gebruikt.
%     -NOTE: A = 

S = 1i*2*pi*frequentie;
Voxel_inhoud = 1;
afstand_tot_Voxel = 1;
W = 1;
c = 3*10^8; %geluidssnelheid


A = zeros(size(Receiver_Loc,1),length(Source));

for i=1:size(Receiver_Loc,1)
    for  a = 1:x-1
        for b = 1:y-1
            for c = 1:z-1
                %a+b*x+c*y*x+1
                A(i,a+b*x+c*y*x+1)=S*W*Voxel_inhoud*exp(-S/c*afstand_tot_Voxel)/(4*pi*afstand_tot_Voxel);
            end
        end
    end
end


Receiver_Data=A*Source;


end

