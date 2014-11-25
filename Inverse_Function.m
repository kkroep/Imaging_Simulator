function [ Pixel_Matrix ] = Inverse_Function( Receiver_Loc, Receiver_Data, frequentie, A)
%This function attempts to reconstruct the area beased on the measured data
%of the receivers
%By: Kees Kroep

Geluidssnelheid = 3*10^8;

S = frequentie;
S = 1i*2*pi*S;

Pixel_Matrix = A'*Receiver_Data;
end

