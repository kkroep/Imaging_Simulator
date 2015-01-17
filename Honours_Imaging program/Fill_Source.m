function [ Source ] = Fill_Source( S_dimensions, Transmitter_locs)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

Source=zeros(S_dimensions(1)*S_dimensions(2)*S_dimensions(3),1); %Just a point source for starters

point_s = Transmitter_locs(1,:); %location of a single point source
Source(T3Dto1D(point_s(1),point_s(2),point_s(3), S_dimensions(1),S_dimensions(2)))=1;
% for i= size(Transmitter_locs,1)
% Source(T3Dto1D(Transmitter_locs(i,1),Transmitter_locs(i,2),Transmitter_locs(i,1), S_dimensions(1),S_dimensions(2)))=1;
% end

end

