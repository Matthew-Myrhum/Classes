%This code takes a system of equations from an LC tank Oscillator and 
%solves for the voltages across the circuit, the current, and its final
%output is the Vout of the system (which occurs right before the second
%Inductor). 
%Code adapted by Matthew Myrhum from Midterm 1 of MAE 40, SS2. Taught by
%Thomas Bewley. 



clear;clc
syms L1 L2 C3 R4 I Va Vb Vout Vo s
eqn1='Va=-s*L2*I';
eqn2='Va-Vb=I/(s*C3)';
eqn3='Vb-Vout=R4*I';
eqn4='Vout-V0=s*L1*I';
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),I,Va,Vb,Vout);
SOL.Vout

