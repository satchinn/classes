clc;
clear;
close all;

%% Question 3
%% Question 3a
%Plot the smooth sine wave
omega = pi;
t = 0:0.001:5;
y = sin(omega*t);
figure(1)
hold on
plot(t,y,'-r','LineWidth',1);
xlabel('t');
ylabel('y');
title('Problem 3a');

%h = 0.1 Blue x's
y_k = y;
t_k = t;
h1 = 0.1;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h1) == 0)
        y_k(k) = 0;
        t_k(k) = 0;
    end
end
%Plot the stair-step function for h1=0.1
y_k1 = y_k;
p = 1000*h1;
for h=1:size(t,2)-1
    if mod(t(h),h1) == 0
        y_k1(h+1:h+p-1) = y_k1(h);
    end
end

plot(t,y_k1,'-b','LineWidth',1);

plot(t_k(1),y_k(1),'xb');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xb');
    end
end

%h = 0.2 Black x's
y_k = y;
t_k = t;
h2 = 0.2;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h2) == 0)
        y_k(k) = 0;
        t_k(k) = 0;
    end
end
%Plot the stair-step function for h1=0.2
y_k1 = y_k;
p = 1000*h2;
for h=1:size(t,2)-1
    if mod(t(h),h2) == 0
        y_k1(h+1:h+p-1) = y_k1(h);
    end
end

plot(t,y_k1,'-y','LineWidth',1);

plot(t_k(1),y_k(1),'xk');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xk');
    end
end

%h = 0.4 Green x's
y_k = y;
t_k = t;
h3 = 0.4;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h3) == 0)
        y_k(k) = 0;
        t_k(k) = 0;
    end
end

%Plot the stair-step function for h1=0.4
y_k1 = y_k;
p = 1000*h3;
for h=1:size(t,2)-1-p/2
    if mod(t(h),h3) == 0
        y_k1(h+1:h+p-1) = y_k1(h);
    end
end

plot(t,y_k1,'-m','LineWidth',1);

plot(t_k(1),y_k(1),'xg');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xg');
    end
end

%% Question 3b
%Plot the smooth sine wave
omega = pi;
t = 0:0.001:5;
y = sin(omega*t);
figure(2)
hold on
plot(t,y,'-r','LineWidth',1);
xlabel('t');
ylabel('y');
title('Problem 3b-h=0.1');

%h = 0.1 Blue x's
y1_k = y;
t1_k = t;
h1 = 0.1;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h1) == 0)
        y1_k(k) = 0;
        t1_k(k) = 0;
    end
end

y1_k1 = y1_k;
t1_k1 = t1_k;
p = 1000*h1;
for h=1:size(t,2)-1
    if mod(t(h),h1) == 0
        y1_k1(h+1:h+p-1) = y1_k1(h);
        t1_k1(h+1:h+p-1) = t1_k1(h);
    end
end

y_foh = y;
for n=1:size(t,2)
    if n <= p
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)))/h1;
    else
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)-y1_k1(n-p)))/h1;
    end
end
plot(t,y_foh,'-b');

plot(t_k(1),y_k(1),'xb');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xb');
    end
end

figure(3)
hold on
plot(t,y,'-r','LineWidth',1);
xlabel('t');
ylabel('y');
title('Problem 3b-h=0.2');

%h = 0.2 Black x's
y_k = y;
t_k = t;
h2 = 0.2;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h2) == 0)
        y_k(k) = 0;
        t_k(k) = 0;
    end
end
%Plot the stair-step function for h1=0.1
y_k1 = y_k;
p = 1000*h2;
for h=1:size(t,2)-1
    if mod(t(h),h2) == 0
        y_k1(h+1:h+p-1) = y_k1(h);
    end
end

y_foh = y;
for n=1:size(t,2)
    if n <= p
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)))/h2;
    else
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)-y1_k1(n-p)))/h2;
    end
end
plot(t,y_foh,'-k');

plot(t_k(1),y_k(1),'xk');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xk');
    end
end

figure(4)
hold on
plot(t,y,'-r','LineWidth',1);
xlabel('t');
ylabel('y');
title('Problem 3b-h=0.4');

%h = 0.4 Green x's
y_k = y;
t_k = t;
h3 = 0.4;
for n=2:size(t,2)
    k = n-1;
    if ~(mod(t(k),h3) == 0)
        y_k(k) = 0;
        t_k(k) = 0;
    end
end

%Plot the stair-step function for h1=0.4
y_k1 = y_k;
p = 1000*h3;
for h=1:size(t,2)-1-p/2
    if mod(t(h),h3) == 0
        y_k1(h+1:h+p-1) = y_k1(h);
    end
end

y_foh = y;
for n=1:size(t,2)
    if n <= p
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)))/h3;
    else
        y_foh(n) = y1_k1(n)+((t(n)-t1_k1(n))*(y1_k1(n)-y1_k1(n-p)))/h3;
    end
end
plot(t,y_foh,'-g');

plot(t_k(1),y_k(1),'xg');
for j=2:size(t_k,2)
    if t_k(j) ~= 0
        plot(t_k(j),y_k(j),'xg');
    end
end

%% Question 3c
figure(5)
hold on
plot(t,y,'-r','LineWidth',1);
xlabel('t');
ylabel('y');
title('Problem 4');
