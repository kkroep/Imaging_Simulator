function [ Receiver_Data_row ] = Forward_Formula( Transmitter_Loc, Receiver_Loc, Sample_Length , Min_freq, Max_freq)
%By: Kees Kroep
%This function calculates the influence of one transducer on one receiver


Geluidssnelheid = 3*10^8;
Receiver_Data_row = zeros(1,Sample_Length);

W=ones(1,Sample_Length);
S = Min_freq:(Max_freq-Min_freq)/Sample_Length:Max_freq;
S = 1i*2*pi*S;


for i=1:Sample_Length
    Receiver_Data_row(i)=W(i)*exp(-S(i)/Geluidssnelheid*norm(Transmitter_Loc-Receiver_Loc))/(4*pi*norm(Transmitter_Loc-Receiver_Loc));
end

end

