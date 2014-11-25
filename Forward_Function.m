function [ Receiver_Data ] = Forward_Function( Transmitter_Loc, Receiver_Loc, frequentie)
%This function calculates the measured data of the transducers
%By; Kees KRoep

%As of now there is one point source

%in the frequency domain. the pressure of eachb receiver is calculated
%using the distance between transmitter and receiver, and the velocity.

%Allocate data and set to zero

%Stappenplan: Maak eerst een P vector aan: de te meten ruimte




Receiver_Data=zeros(size(Receiver_Loc,1));
for i=1:size(Receiver_Loc,1)
    
    %For every transmitter add signal
    for j=1:size(Transmitter_Loc,1)
        %Caclulate influence of transmitter on receiver
        Receiver_Data(i,:) = Receiver_Data(i,:) + Forward_Formula( Transmitter_Loc(j,:), Receiver_Loc(i,:) , frequentie);
    end
end

end

