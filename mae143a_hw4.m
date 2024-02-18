clc;
clear;
close all;

%% Problem 1
% 1a
figure(1)
F_hpa = RR_tf([1 -1],[1 1]);
RR_bode(F_hpa)

% 1d
figure(2)
RR_step(F_hpa)

%% Problem 2
% For omega c = 1
omega_c = 1;
den_2a = [1 0.77*omega_c omega_c^2];
den_2b = [1 1.85*omega_c omega_c^2];

figure(3)
F_2a = RR_tf(omega_c^2,den_2a);
RR_bode(F_2a)

figure(4)
F_2b = RR_tf(omega_c^2,den_2b);
RR_bode(F_2b)

f_4den = RR_PolyProd(den_2a,den_2b);
figure(5)
F_4 = RR_tf(omega_c^4,f_4den);
RR_bode(F_4)

figure(6)
RR_step(F_4)

% For omega c = 10
omega_c = 10;
den_2a = [1 0.77*omega_c omega_c^2];
den_2b = [1 1.85*omega_c omega_c^2];

figure(7)
F_2a = RR_tf(omega_c^2,den_2a);
RR_bode(F_2a)

figure(8)
F_2b = RR_tf(omega_c^2,den_2b);
RR_bode(F_2b)

f_4den = RR_PolyProd(den_2a,den_2b);
figure(9)
F_4 = RR_tf(omega_c^4,f_4den);
RR_bode(F_4)

figure(10)
RR_step(F_4)

