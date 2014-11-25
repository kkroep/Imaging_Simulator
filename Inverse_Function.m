function [ Pixel_Matrix ] = Inverse_Function( Receiver_Loc, Receiver_Data, Pixel_Matrix, frequentie, Projection_Coordinates)
%This function attempts to reconstruct the area beased on the measured data
%of the receivers
%By: Kees Kroep

[Screen_Heigth, Screen_Width]=size(Pixel_Matrix);

Geluidssnelheid = 3*10^8;

S = frequentie;
S = 1i*2*pi*S;

Pixel_Matrix=zeros(Screen_Heigth, Screen_Width);
Pixel_Loc = zeros(1,3);

%Calculate magnitude for each pixel
for i=1:Screen_Width
    i
    for j=1:Screen_Heigth
        Pixel_Loc = Projection_Coordinates(1,:) + (Projection_Coordinates(2,:)-Projection_Coordinates(1,:))/Screen_Heigth*j + (Projection_Coordinates(3,:)-Projection_Coordinates(2,:))/Screen_Width*i;
        
        for k=1:size(Receiver_Loc,1)
                Pixel_Matrix(j,i) = Pixel_Matrix(j,i)+exp(S/Geluidssnelheid)*norm(Pixel_Loc-Receiver_Loc(k,:))*Receiver_Data(k);
        end
    end
end


end

