% script Colpitts_full
% Solves the equations of an LC tank and an opamp drivin Colpitts oscillator.
% This code also solves for variables a2, a1, and a0 as well as a3, a4, and
% w2. 
% Code created by Matthew Myrhum, adapted from midterm solutions written by
% Thomas Bewley for MAE 40 SS2. 

% Problem 2a - simple LC tank
clear; clc
syms C1 C2 L3 R4 I Va Vb Vout Vo s
eqn1='I=-s*C2*Va'; eqn2='Va-Vb=s*L3*I';	eqn3='Vb-Vout=R4*I'; eqn4='I=C1*(s*Vout-Vo)';
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),I,Va,Vb,Vout); SOL.Vout


% Problem 3b - Colpitts oscillator WITHOUT the extra resistor
clear; 
syms C1 C2 L3 R4 R5 R6 I1 I2 I3 I4 I5 I6 I7 Va Vb Vout Vout0 Va0 I30 s
eqn1 = 'I3=I4';		eqn5 = 'I2=-C2*(s*Va-Va0)';	eqn9 = '-Vout=R6*I6';
eqn2 = 'I5=I6';		eqn6 = 'Va-Vb=L3*(s*I3-I30)';	eqn10 = 'I1=C1*(s*Vout-Vout0)';
eqn3 = 'I2=I3+I5';	eqn7 = 'Vb-Vout=R4*I4';		
eqn4 = 'I4+I6+I7=I1';	eqn8 = 'Va=R5*I5';		
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),str2sym(eqn5),...
str2sym(eqn6),str2sym(eqn7),str2sym(eqn8),str2sym(eqn9),str2sym(eqn10),...
I1,I2,I3,I4,I5,I6,I7,Va,Vb,Vout);  SOL.Vout


% Problem 3c - Colpitts oscillator WITH the extra resistor
clear; 
syms C1 C2 L3 R4 R5 R6 R8 I1 I2 I3 I4 I5 I6 I7 I8 Va Vb Vs Vout Vout0 Va0 I30 s
eqn1 = 'I3=I4';		eqn5 = 'I6+I7=I8';		eqn9 = 'Va=R5*I5';
eqn2 = 'I5=I6';		eqn6 = 'I2=-C2*(s*Va-Vo)';	eqn10 = '-Vs=R6*I6';
eqn3 = 'I2=I3+I5';	eqn7 = 'Va-Vb=s*L3*I3';		eqn11 = 'I1=C1*(s*Vout-Vo)';
eqn4 = 'I4+I8=I1';	eqn8 = 'Vb-Vout=R4*I4';		eqn12 = 'Vs-Vout=R8*I8';
SOL=solve(str2sym(eqn1),str2sym(eqn2),str2sym(eqn3),str2sym(eqn4),str2sym(eqn5),...
str2sym(eqn6),str2sym(eqn7),str2sym(eqn8),str2sym(eqn9),str2sym(eqn10),...
str2sym(eqn11),str2sym(eqn12),I1,I2,I3,I4,I5,I6,I7,I8,Va,Vb,Vs,Vout);  
SOL.Vout


%SOLVING FOR a0, a1, a2
a2= (C1*C2*R4*R5*R8+C1*L3*R8+C2*L3*R5)/(C1*C2*L3*R5*R8)
a1=(L3+C2*R4*R5+C1*R4*R8+C1*R5*R8+C2*R5*R8)/(C1*C2*L3*R5*R8)
a0= (R4+R5+R6+R8)/(C1*C2*L3*R5*R8)

%SOLVING FOR a3, a4, w2
q=a1-((a2)^2)/3;
r=a0+2*((a2)^3)/27-a2*a1/3;
d=(r^2)/4+(q^3)/27;
a3=a2/3-((-r/2+(d)^0.5)^(1/3))-((-r/2-(d)^0.5)^(1/3))
a4=a2-a3
w2=(a0/a3)^0.5
