function [ Pixel_Matrix ] = Inverse_Function( Receiver_Loc, Receiver_Data, Pixel_Matrix, Sample_Length, Min_freq, Max_freq)
%This function attempts to reconstruct the area beased on the measured data
%of the receivers
%By: Kees Kroep

[Screen_Heigth, Screen_Width]=size(Pixel_Matrix);

Geluidssnelheid = 3*10^8;

S = Min_freq:(Max_freq-Min_freq)/Sample_Length:Max_freq;
S = 1i*2*pi*S;

%Calculate magnitude for each pixel
for i=1:Screen_Width
    for j=1:Screen_Heigth
        Pixel_Matrix(j,i) = exp(S(1)/Geluidssnelheid);%norm(x-xsn)*Data
    end
end


%x-xsn = de afstand naar de pixel
end

