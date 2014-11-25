function [ Receiver_Data ] = Forward_Function( Transmitter_Loc, Receiver_Loc, frequentie, Source, x, y, z)
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
%     -NOTE: A is


A = zeros(size(Receiver_Loc,1),length(Source));

for i=1:size(Receiver_Loc,1)
    for  a = 1:x
        for b = 1:y
            for c = 1:z
            A(i,a+b*x+c*y*x)=1;
            end
        end
    end
end


Receiver_Data=zeros(size(Receiver_Loc,1));


end

