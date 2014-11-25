function [ Pixel_Matrix ] = Inverse_Function( Receiver_Loc, Receiver_Data, frequentie, Projection_Coordinates, x, y, z)
%This function attempts to reconstruct the area beased on the measured data
%of the receivers
%By: Kees Kroep

Geluidssnelheid = 3*10^8;

S = frequentie;
S = 1i*2*pi*S;

Pixel_Matrix=zeros(x,y,z);
Pixel_Loc = zeros(1,3);

end

