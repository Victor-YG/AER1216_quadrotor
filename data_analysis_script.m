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
plot(x0p5,r0p5,'DisplayName','Velcity = 0.5 m/s')
plot(x1,r1,'DisplayName','Velcity = 1 m/s')
plot(x2,r2,'DisplayName','Velcity = 2 m/s')
plot(x5,r5,'DisplayName','Velcity = 5m/s')
xlabel('Length along circle l/L')
ylabel('Error ||r||')
ylim([0 0.9])
% yscale log
legend
title('Error of one full rotation with R = 10 m');
grid on
hold off

figure 
hold on
plot(xR2,R2,'DisplayName','Radius = 2 m')
plot(x1,r1,'DisplayName','Radius = 10 m')
plot(xR20,R20,'DisplayName','Radius = 20 m')
xlabel('Length along circle l/L')
ylabel('Error ||r||')
ylim([0 0.03])
% yscale log
legend
title('Error of one full rotation with V = 1 m/s');
grid on
hold off

constant_R = [0.5, 1, 2, 5; 0.0010, 0.0032, 0.0125, 0.3471];
constant_V = [2, 10, 20; 0.0126, 0.0032, 0.0022];

figure
hold on
plot(constant_V(1,:),constant_V(2,:),'o-')
xlabel('Radius')
ylabel('Mean Error')
title('Mean error with V = 1 m/s')
ylim([0 0.03])
% yscale log
grid on
hold off

figure
hold on
plot(constant_R(1,:),constant_R(2,:),'o-')
xlabel('Veocity')
ylabel('Mean Error')
title('Mean error with R = 10 m');
ylim([0 0.9])
% yscale log
grid on
hold off

gain_multiplier = [0.25, 0.5, 1, 2, 4, 8, 16];
kp1 = [0.0936, 0.0331, 0.0144, 0.0208, 0.0279, 0.0340, 0.0363];
kd1 = [0.0147, 0.0145, 0.0144, 0.0138, 0.0120, 0.0095, 0.0118];
kp2 = [0.0957, 0.0361, 0.0095, 0.0161, 0.0258, 0.0300, 0.0287];
kd2 = [0.0099, 0.0098, 0.0095, 0.0078, 0.0067, 0.0038, 0.0042];
kp3 = [0.0037, 0.0037, 0.0038, 0.0040, 0.0040, 0.0032, 0.0034];
kd3 = [0.0041, 0.0037, 0.0032, 0.0039, 0.0040, 0.0040, 0.0040];

figure 

ax1=subplot(3,1,1);
hold on
title('Effect of u gain on mean error')
plot(gain_multiplier,kp1, 'o-')
plot(gain_multiplier,kd1, 'o-')
legend('Kp', 'Kd')
ylabel('Mean Error')
yticks(0:0.01:0.1);
grid on
hold off

ax2=subplot(3,1,2);
hold on
title('Effect of v gain on mean error')
plot(gain_multiplier,kp2, 'o-')
plot(gain_multiplier,kd2, 'o-')
ylabel('Mean Error')
legend('Kp', 'Kd')
yticks(0:0.01:0.1);
grid on
hold off

ax3=subplot(3,1,3);
hold on
title('Effect of z gain on mean error')
plot(gain_multiplier,kp3, 'o-')
plot(gain_multiplier,kd3, 'o-')
ax3.YAxis.Exponent = 0;
xlabel('Gain Multiplier')
ylabel('Mean Error')
legend('Kp', 'Kd')
grid on
hold off
linkaxes([ax1 ax2 ax3],'x')

