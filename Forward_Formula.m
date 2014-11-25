function [ Receiver_Data_row ] = Forward_Formula( Transmitter_Loc, Receiver_Loc , frequentie)
%By: Kees Kroep
%This function calculates the influence of one transducer on one receiver


Geluidssnelheid = 3*10^8;

W = 1;
S = 1i*2*pi*frequentie;


Receiver_Data_row=W*exp(-S/Geluidssnelheid*norm(Transmitter_Loc-Receiver_Loc))/(4*pi*norm(Transmitter_Loc-Receiver_Loc));

end

