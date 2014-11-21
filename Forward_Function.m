function [ Receiver_Data ] = Forward_Function( Transmitter_Loc, Receiver_Loc, Sample_Length, Min_freq, Max_freq)
%This function calculates the measured data of the transducers
%By; Kees KRoep

%As of now there is one point source

%in the frequency domain. the pressure of eachb receiver is calculated
%using the distance between transmitter and receiver, and the velocity.

%Allocate data and set to zero
Receiver_Data=zeros(size(Receiver_Loc,1),Sample_Length);
for i=1:(numel(Receiver_Loc)/2)
    
    %For every transmitter add signal
    for j=1:(numel(Transmitter_Loc)/2)
        
        %Caclulate influence of transmitter on receiver
        Receiver_Data(i,:) = Receiver_Data(i,:) + Forward_Formula( Transmitter_Loc(j,:), Receiver_Loc(i,:), Sample_Length , Min_freq, Max_freq);
    end
end

end

