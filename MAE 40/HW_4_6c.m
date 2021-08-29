%This code takes a system of equations from a Hartley Oscillator WITH an 
%reistor (R8) and solves for the voltages across the circuit, the current, and its final
%output is the Vout of the system (which occurs right before the second
%Inductor). 
%Code adapted by Matthew Myrhum adapted from Midterm 1 of MAE 40, SS2. Taught by
%Thomas Bewley. 

clear;clc
syms L1 L2 C3 R4 R5 R6 R8 I1 I2 I3 I4 I5 I6 I7 I8 Va Vb Vs Vout Vout0 I20 I10 s
eqn1 = 'I3=I4';
eqn2 = 'I5=I6';
eqn3 = 'I2=I3+I5';
eqn4 = 'I4+I8=I1';
eqn5 = '-Va=s*L2*(I2-I20)';
eqn6 = 's*(Va-Vb)=I3/C3';
eqn7 = 'Vb-Vout=R4*I4';
eqn8 = 'Va=R5*I5';
eqn9 = '-Vs=R6*I6';
eqn10 ='Vout-V0=S*L1*(I1-I10)';
eqn11= 'I6+I7=I8';
eqn12= 'Vs-Vout=I8*R8';
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),str2sym(eqn5),...
str2sym(eqn6),str2sym(eqn7),str2sym(eqn8),str2sym(eqn9),str2sym(eqn10),...
str2sym(eqn11),str2sym(eqn12),I1,I2,I3,I4,I5,I6,I7,I8,Va,Vb,Vs,Vout); 
SOL.Vout