clear
close all


r0p5 = load('error_v0p5_r10.mat');
r0p5 = r0p5.full_rotation_error;
x0p5 = linspace(0,1,length(r0p5));

r1 = load('error_v1_r10.mat');
r1 = r1.full_rotation_error;
x1 = linspace(0,1,length(r1));

r2 = load('error_v2_r10.mat');
r2 = r2.full_rotation_error;
x2 = linspace(0,1,length(r2));

r5 = load('error_v5_r10.mat');
r5 = r5.full_rotation_error;
x5 = linspace(0,1,length(r5));

R2 = load('error_v1_r2.mat');
R2 = R2.full_rotation_error;
xR2 = linspace(0,1,length(R2));

R20 = load('error_v1_r20.mat');
R20 = R20.full_rotation_error;
xR20 = linspace(0,1,length(R20));

figure 
hold on
plot(x0p5,r0p5,'DisplayName','velcity = 0.5')
plot(x1,r1,'DisplayName','velcity = 1')
plot(x2,r2,'DisplayName','velcity = 2')
plot(x5,r5,'DisplayName','velcity = 5')
xlabel('Length along circle l/L')
ylabel('Error ||r||')
% ylim([])
legend
title('Error of one full rotation with R=10');
hold off

figure 
hold on
plot(xR2,R2,'DisplayName','Radius = 2')
plot(x1,r1,'DisplayName','Radius = 10')
plot(xR20,R20,'DisplayName','Radius = 20')
xlabel('Length along circle l/L')
ylabel('Error ||r||')
ylim([0 0.1])
legend
title('Error of one full rotation with V=1');
hold off

constant_R = [0.5, 1, 2, 5; 0.0037, 0.0141, 0.0540, 0.4605];
constant_V = [2, 10, 20; 0.0611, 0.0141, 0.0067];

figure
hold on
plot(constant_V(1,:),constant_V(2,:),'o-')
xlabel('Radius')
ylabel('Mean Error')
title('Mean error with R=10');
hold off

figure
hold on
plot(constant_R(1,:),constant_R(2,:),'o-')
xlabel('Veocity')
ylabel('Mean Error')
title('Mean error with V=1')
hold off
