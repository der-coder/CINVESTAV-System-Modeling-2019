function exam
%% SPHERICAL PENDULUM SIMULATION
%%  ISAAC AYALA LOZANO
clear
clc
close all
%% INITIAL CONDITIONS
tspan = [0 10];
b     = 1; % m
theta   = pi/10;   % rad/s
phi     = pi/5;   % rad/s
Ptheta  = 1;   % kg m /s
Pphi    = 1;   % kg m/s
x0 = [theta Ptheta phi Pphi];
%% Solution
[t,sol] = ode45(@pendulum,tspan,x0);
%% Convert to cartesian
r = b * sin(sol(:,1));
x = r .* cos(sol(:,3));
y = r .* sin(sol(:,3));
z = b .* sin(sol(:,1));
%%%% Phase plot theta p_theta
figure(1)
plot(sol(:,1),sol(:,2),'k')
xlabel('$\theta$','Interpreter','latex')
ylabel('$p_{\theta}$','Interpreter','latex')
title('Diagrama fase $\theta - p_\theta$')
set(gcf,'Color',[1 1 1])
print('-dpdflatex', 'img/phaseThetaPTheta.tex', '-S300,250','-mono');
%%%% Phase plot phi p_phi
figure(2)
plot(sol(:,3),sol(:,4),'k')
xlabel('$\phi$','Interpreter','latex')
ylabel('$p_{\phi}$','Interpreter','latex')
title('Diagrama fase $\phi - p_\phi$', 'Interpreter', 'latex')
print('-dpdflatex', 'img/phasePhiPPhi.tex', '-S300,200','-mono');
%%%% 3D plot of the pendulum in xyz coordinates
figure(3)
plot3(x, y, z,'k')
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$z$','Interpreter','latex')
title('Trayectoria del péndulo')
print('-dpdflatex', 'img/3Dplot.tex', '-S300,250','-mono');
%%%% Time plot of x, y, z
figure(4)
plot(t, x, 'k',  t, y, '--k', t, z, '-*k')
xlabel('Tiempo','Interpreter','latex')
ylabel('$x,\ y,\ z$','Interpreter','latex')
title('Gráfica respecto al tiempo de $x, y, z$', 'Interpreter', 'latex')
legend({'  $x$','  $y$', '$  z$'},'Interpreter','latex','location', 'eastoutside', 'orientation', 'vertical')
legend('boxoff')
print('-dpdflatex', 'img/timeXYZ.tex', '-S300,180','-mono');
%%%% Time plot of theta, phi
figure(5)
plot(t, sol(:,1),'k', t, sol(:,3),'--k')
xlabel('Tiempo','Interpreter','latex')
ylabel('$\theta, \phi$','Interpreter','latex')
legend({'  $\theta$','  $\phi$'},'Interpreter','latex','location', 'east', 'orientation', 'vertical')
legend('boxoff')
title('Gráfica respecto al tiempo de $\theta, \ \phi$', 'Interpreter', 'latex')
print('-dpdflatex', 'img/timeTRhetaPhi.tex', '-S200,200','-mono');
%%%% Phase plot theta phi
figure(6)
plot(sol(:,1), sol(:,3),'k')
xlabel('$\theta$','Interpreter','latex')
ylabel('$\phi$','Interpreter','latex')
title('Diagrama fase de $\theta - \phi$', 'Interpreter', 'latex')
print('-dpdflatex', 'img/phaseThetaPhi.tex', '-S300,200','-mono');
end

function dx = pendulum(~,x)
%% CONSTANTS
b     = 1; % m
m     = 1; % kg
g     = 9.81;
gamma   = 0.01;   % m
dx=zeros(4,1);
Theta = x(1);
pTheta = x(2);
Phi = x(3);
pPhi = x(4);
%% Terms for d_p_theta
f1 = ((pTheta^2)*sin(Theta))/(2*m*b*b*((cos(Theta))^3));
f2 = ((pPhi^2)*cos(Theta))/(m*b*b*((sin(Theta))^3));
f3 = m*g*b*sin(Theta);
d_theta   = pTheta/(2*m*b*b*((cos(Theta))^2));
d_p_theta = -f1 + f2 - f3;
d_phi     = pPhi/(m*b*((sin(Theta))^2));
d_p_phi   = 0;
dx(1) = d_theta;
dx(2) = d_p_theta;
dx(3) = d_phi;
dx(4) = d_p_phi;
end
