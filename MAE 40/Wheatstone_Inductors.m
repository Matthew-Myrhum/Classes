% script Wheatstone_Inductors.m
% Computes the currents and intermediate nodal voltages of a Wheatstone Bridge with two inductors.
% Written by Matthew Myrhum, modified from the code by T Bewley provided at
% the RR codebase.

syms L5 s V0;  R1=1e3; R4=1e3; L2=1e-5; R3=1e5;
A=[1 -1 -1 0 0 0 0 0; 0 1 0 -1 -1 0 0 0; 0 0 1 1 0 -1 0 0; 0 R1 0 0 0 0 1 0; ...
   0 0 s 0 0 0 0 1/L2; 0 0 0 R3 0 0 -1 1; 0 0 0 0 R4 0 -1 0; 0 0 0 0 0 s 0 1/L5];
b=[0; 0; 0; V0; V0/L2; 0; 0; 0]; x=A\b
I_3=x(4)
G=I_3/V0