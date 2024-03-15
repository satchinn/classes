clc;
clear;
close all;

%% Question 5
figure(1)
Tv = tf(10,[0.1 20]);
bode(Tv)

%% Question 6
syms r1 r2 r c w v1 v2 vA s

% r = 1000;
% r1 = 6071;
% r2 = 1000;
% c = 10^-6;

eqn1 = vA/r1 + (vA-v2)/r2 == 0;
eqn2 = s*c*(vA-v1) + vA/r == 0;

sol = solve(eqn1,eqn2);

T = sol.v2/sol.v1;
T = subs(T,{r,r1,r2,c},{1000,6071,1000,10^-6});

[num,den] = numden(T);

num_tf = coeffs(num,s);
den_tf = coeffs(den,s);

num_tf=num_tf(end:-1:1);   % this reverses the order of the vector of coefficients.
den_tf=den_tf(end:-1:1);

figure(2)
T6 = tf([7071 0],[6071, 6071000]);
bode(T6)


% expr1 = (r1^2*r^2*c^2*w^2 + r1^2)*((r1 + r2)^2)*r^2*c^2*w - 2*((r1 + r2)^2)*r^2*c^2*w^2*r1^2*r^2*c^2*w;
% expr1 = simplify(expr1);

%% Question 8
syms R1 R2 C1 C2 R3 R4

R1 = 25000;
C1 = 10^-9;
R2 = 10^6;
C2 = 10^-9;
R3 = 1980000;
R4 = 20000;

T1 = 1/(R1*C1*s+1);
T2 = (R3+R4)/R4;
T3 = (R2*C2*s)/(R2*C2*s+1);

T_8 = T1*T2*T3;

%T_8 = subs(T,{R1,C1,R2,C2,R3,R4},{25000,10^-9,10^6,10^-9,180000,20000});
[num,den] = numden(T_8);

num_tf = coeffs(num,s);
den_tf = coeffs(den,s);

num_tf=num_tf(end:-1:1);   % this reverses the order of the vector of coefficients.
den_tf=den_tf(end:-1:1);

figure(3)
T8 = tf([4000000 0],[1, 41000, 40000000]);
bode(T8)




