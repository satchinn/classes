clc;
clear;
close all;

%% Question 1

syms s z
h = 0.2;
s = (2*(z-1))/(h*(z+1));
F1 = 1/((s+1)*(s^2+s+1));
% Finding the simplified transfer function F1
F1 = 1/simplifyFraction(1/F1);

F1a_s = RR_tf(1,[1 2 2 1]);
%Finding F1a(z) with no prewarping
F1a_z = RR_C2D_tustin(F1a_s,h);

%Finding F1b(z) with prewarping
omegac = pi/(2*h);
F1b_z = RR_C2D_tustin(F1a_s,h,omegac);
%Multiply F1a(z) by the unit step z/(z-1)
%Then partial fraction expand it out
unit_ztep = RR_tf([1 0],[1 -1]);
F1a_z_step_num = F1a_z.num*unit_ztep.num;
F1a_z_step_den = F1a_z.den*unit_ztep.den;
F1a_z_step = [F1a_z_step_num,F1a_z_step_den];
%Using RR_step to do what I did in the previous 5 lines of code
%RR_step(F1a_z);

RR_bode(F1a_s)
