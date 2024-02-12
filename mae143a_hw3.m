clear;
clc;
close all;

%% Problem 0

%PID Bode Plot
figure(1)
F_pid = RR_tf([1 101 100],[1 0]);
RR_bode(F_pid)

figure(2)
F_bp = RR_tf([1 0],[1 101 100]);
RR_bode(F_bp)

figure(3)
F_ap = RR_tf([1 -1],[1 1]);
RR_bode(F_ap)

%% Problem 4
%Part 1
syms K c k s L1 L2 L3 L4 L5 L6 L7 G

M = 1000;
C = 0;
m = 0;
c = 1;
k = 1;
K = 4*pi^2*1000;

L1 = M*s^2+C*s+K;
L2 = C*s+K;
L3 = m*s^2+c*s+k;
L4 = c*s+k;
L5 = c*s+k;

L6 = L3*L1 - L5*L4 + L3*L5;
L7 = L3*L2;

numG=coeffs(L7,s);          % this extracts the powers of s in the num and den
denG=coeffs(L6,s);

numG=numG(end:-1:1);   % this reverses the order of the vector of coefficients.
denG=denG(end:-1:1);

figure(4)
G = RR_tf(numG,denG);
RR_bode(G)

%Part 2
syms K c k s L1 L2 L3 L4 L5 L6 L7 G

M = 1000;
C = 0;
m = 100;
c = 10;
k = 10;
K = 4*pi^2*1000;

L1 = M*s^2+C*s+K;
L2 = C*s+K;
L3 = m*s^2+c*s+k;
L4 = c*s+k;
L5 = c*s+k;

L6 = L3*L1 - L5*L4 + L3*L5;
L7 = L3*L2;

numG=coeffs(L7,s);          % this extracts the powers of s in the num and den
denG=coeffs(L6,s);

numG=numG(end:-1:1);   % this reverses the order of the vector of coefficients.
denG=denG(end:-1:1);

figure(5)
G = RR_tf(numG,denG);
RR_bode(G)







