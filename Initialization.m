function [ Source ] = Initialization( Start_point, x, y, z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Source = zeros(x,y,z);

Source(5,5,5) = 1;
end

