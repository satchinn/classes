clc;
clear;
close all;

%% Problem 4

syms L1 L2 L3 L4 L5 L6 L7 L8 L9 x y z u
eqn1 = L1*x + L2*y == 0;
eqn2 = L3*x+L4*y+L5*z == 0;
eqn3 = L6*x+L7*y+L8*z == L9*u;
sol=solve(eqn1,eqn2,eqn3); G = sol.y/u;

syms sig xbar ybar zbar b s
G=subs(sol.y/u,{L1,L2,L3,L4,L5,L6,L7,L8,L9},{sig+s,-sig,-zbar,-1-s,-xbar,ybar,xbar,-b-s,b});
[numG,denG] = numden(G);      % this extracts out the num and den of G
numG=coeffs(numG,s);          % this extracts the powers of s in the num and den
denG=coeffs(denG,s);
numG=simplify(numG/denG(end)); % this makes the den monic
denG=simplify(denG/denG(end));

numG=numG(end:-1:1);   % this reverses the order of the vector of coefficients.
denG=denG(end:-1:1);

numroots = RR_roots(numG);
denroots = RR_roots(denG);
% zeros =
%  
% -sig
%poles =
%
%                                                    ((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3)/3 - sig/3 - (b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)/((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3) - b/3 - 1/3
%- b/3 - sig/3 - (((3^(1/2)*1i)/2 + 1/2)*((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3))/3 - (((3^(1/2)*1i)/2 - 1/2)*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2))/((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3) - 1/3
%- b/3 - sig/3 + (((3^(1/2)*1i)/2 - 1/2)*((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3))/3 + (((3^(1/2)*1i)/2 + 1/2)*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2))/((9*(b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/2 - (b + sig + 1)^3 + (3*3^(1/2)*(27*((2*(b + sig + 1)^3)/27 - ((b + sig + 1)*(xbar^2 + b + sig + b*sig + sig*zbar))/3 + sig*(xbar^2 + ybar*xbar + b + b*zbar))^2 + 4*(b + sig + b*sig + sig*zbar - (b + sig + 1)^2/3 + xbar^2)^3)^(1/2))/2 - (27*sig*(xbar^2 + ybar*xbar + b + b*zbar))/2)^(1/3) - 1/3
%

%% Problem 5

G1 = G/s;
[numG1,denG1] = numden(G);      % this extracts out the num and den of G
numG1=coeffs(numG1,s);          % this extracts the powers of s in the num and den
denG1=coeffs(denG1,s);
numG1=simplify(numG1/denG1(end)); % this makes the den monic
denG1=simplify(denG1/denG1(end));

numG1=numG1(end:-1:1);   % this reverses the order of the vector of coefficients.
denG1=denG1(end:-1:1);


numroots1 = RR_roots(numG1);
denroots1 = RR_roots(denG1);

syms b1 b0 p1 p2 p3 d1 d2 d3 d4
eqn4 = (b1*s+b0)/((s-p1)*(s-p2)*(s-p3)*s) == d1/(s-p1)+d2/(s-p2)+d3/(s-p3)+d4/s;
A=solve(eqn4,d1);
B=solve(eqn4,d2);
C=solve(eqn4,d3);
D=solve(eqn4,d4);
A0 = subs(A,{b1,b0,p1,p2,p3},{numG1(1),numG1(2),denroots1(1),denroots1(2),denroots1(3)});
B0 = subs(B,{b1,b0,p1,p2,p3},{numG1(1),numG1(2),denroots1(1),denroots1(2),denroots1(3)});
C0 = subs(C,{b1,b0,p1,p2,p3},{numG1(1),numG1(2),denroots1(1),denroots1(2),denroots1(3)});
D0 = subs(D,{b1,b0,p1,p2,p3},{numG1(1),numG1(2),denroots1(1),denroots1(2),denroots1(3)});
% A1 = subs(A1,{d2},{B1});
% B1 = subs(B1,{d1},{A1});
% C1 = subs(C1,{d1},{A1});
% C = subs(C,{d4},{D});
% B = subs(B,{d3,d4},{C,D});
% A = subs(A,{d2,d3,d4},{B,C,D});

%% Question 6
%6a
sig_real=4;
b_real=1;
ubar_real=48;

pt1 = [sqrt(b_real*(ubar_real-1)),sqrt(b_real*(ubar_real-1)),-1];
pt2 = [-1*sqrt(b_real*(ubar_real-1)),-1*sqrt(b_real*(ubar_real-1)),-1];
pt3 = [0,0,-1*ubar_real];

P1 = subs(denroots1,{xbar,ybar,zbar,sig,b},{pt1(1),pt1(2),pt1(3),sig_real,b_real});
P2 = subs(denroots1,{xbar,ybar,zbar,sig,b},{pt2(1),pt2(2),pt3(3),sig_real,b_real});
P3 = subs(denroots1,{xbar,ybar,zbar,sig,b},{pt3(1),pt3(2),pt3(3),sig_real,b_real});

numG1_1 = subs(numG1,{xbar,sig,b},{pt1(1),sig_real,b_real});
numG1_2 = subs(numG1,{xbar,sig,b},{pt2(1),sig_real,b_real});
numG1_3 = subs(numG1,{xbar,sig,b},{pt3(1),sig_real,b_real});

A1 = subs(A,{b1,b0,p1,p2,p3},{numG1_1(1),numG1_1(2),P1(1),P1(2),P1(3)});
B1 = subs(B,{b1,b0,p1,p2,p3},{numG1_1(1),numG1_1(2),P1(1),P1(2),P1(3)});
C1 = subs(C,{b1,b0,p1,p2,p3},{numG1_1(1),numG1_1(2),P1(1),P1(2),P1(3)});
D1 = subs(D,{b1,b0,p1,p2,p3},{numG1_1(1),numG1_1(2),P1(1),P1(2),P1(3)});

A2 = subs(A,{b1,b0,p1,p2,p3},{numG1_2(1),numG1_2(2),P2(1),P2(2),P2(3)});
B2 = subs(B,{b1,b0,p1,p2,p3},{numG1_2(1),numG1_2(2),P2(1),P2(2),P2(3)});
C2 = subs(C,{b1,b0,p1,p2,p3},{numG1_2(1),numG1_2(2),P2(1),P2(2),P2(3)});
D2 = subs(D,{b1,b0,p1,p2,p3},{numG1_2(1),numG1_2(2),P2(1),P2(2),P2(3)});

%6b
t = 0:0.1:10;

y1 = exp(P1(1)*t)+exp(P1(2)*t)+exp(P1(3)*t);
figure(1); hold on
plot(t,y1,'-r','LineWidth',2);
xlabel('t');
ylabel('y');
title('Problem 6b');

