function [ Source ] = Initialization( Start_point, x, y, z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Source = zeros(x*y*z,1);

loc_T = [5,5,5]; % LOcatie transmitter

Source(loc_T(1)+loc_T(2)*x+loc_T(3)*x*y) = 1;
end

