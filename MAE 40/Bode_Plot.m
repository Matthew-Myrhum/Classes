%This code was written by Matthew Myrhum for HW2 of MAE 40 with Thomas
%Bewley. This code is intended to create the Bode Plot given a transfer
%function. This code uses a special, downloaded tool box in order to create
%the Bode plot with a simple command. 
H = tf([1],[1 0.5 1])
bode(H)