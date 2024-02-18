clc;
clear;
close all;

syms i1 i2 vx is v0 i0

vx = -1000*i1+1000*is;
eqn1 = -1000*is+1000*i1+2000*i1+330*(i1-i2)+0.66*vx == 0;
eqn2 = 330*i2-0.66*vx+330*(i2-i1) == 0;

sol = solve(eqn1,eqn2,i1,i2);
v0 = sol.i2*330;
i0 = sol.i2;

