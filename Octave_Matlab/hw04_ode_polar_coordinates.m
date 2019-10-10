% HOMEWORK 04 - SYSTEM MODELLING

% ISAAC AYALA LOZANO

% NUMERICAL SOLUTION TO THE ODE SYSTEM
% x = X Cos(w*t) + Y Sin(w*t)
% y = - X Sin(w*t) + Y Cos(w*t)

function hw_solution
  clc
  clear
  close all

  for n=0:1:5  % Initial condition range set from -10 to 10
    
    % Store initial conditions in matrix x0
    x0 =  [n;n;n;n];
    
    % Use of ODE45 solver to numerically integrate the ODE
    [t,x]=ode45(@ode_system,[0 10],x0); % [time, state variables]
    
    
    figure(1) % Plot t, x(t)
    hold on
    plot(t,x(:,1),'-+k');
    
    xlabel('Tiempo: [s]','fontsize',14);
    ylabel('Posición (x) : [m]','fontsize',14);
    title('Solución al sistema para x(t)','fontsize',20)
    
    figure(2) % Plot t, y(t)
    hold on
    plot(t,x(:,3),'-*k');
    
    xlabel('Tiempo: [s]','fontsize',14);
    ylabel('Posición (y) : [m]','fontsize',14);
    title('Solución al sistema para y(t)','fontsize',20)
    
    figure(3) % Plot t, x(t), y(t)
              %Only the last set of initial conditions
    plot(t,x(:,1),'-+k',t,x(:,3),'-*k','LineWidth',2);
    
    xlabel('Tiempo: [s]','fontsize',14);
    ylabel('Posición : [m]','fontsize',14);
    title('Solución al sistema para x(t) y y(t)','fontsize',20)
    legend('x(t)','y(t)')
        
    figure(10) % Plot x(t), x'(t)
    hold on
    plot(x(:,1),x(:,2),'k','LineWidth',2);
    
    xlabel('Posición (x) : [m]','fontsize',14);
    ylabel("Velocidad (x') : [m/s]",'fontsize',14);
    title('Diagrama fase de posición y velocidad para eje x','fontsize',20)
    
    figure(11) % Plot y(t), y'(t)
    hold on
    plot(x(:,3),x(:,4),'k','LineWidth',2);
    
    xlabel('Posición (y) : [m]','fontsize',14);
    ylabel("Velocidad (y') : [m/s]",'fontsize',14);
    title('Diagrama fase de posición y velocidad para eje y','fontsize',20)
          
    figure(12) % Plot x(t), y(t)
    hold on
    plot(x(:,1),x(:,3),'k','LineWidth',2);
    
    xlabel('Posición (x) : [m]','fontsize',14);
    ylabel('Posición (y) : [m]','fontsize',14);
    title('Diagrama fase de posiciones en x, y','fontsize',20)
    
    hold off
  

  
endfor

print -f1 fig01.png
print -f2 fig02.png
print -f3 fig03.png
print -f10 fig10.png
print -f11 fig11.png
print -f12 fig12.png


endfunction

function dx=ode_system(~,x)
  
  % Define constants
  w = 1; % Angular velocity [radians/sec]
  
  % State variables
  
  dx(1) = x(2);
  dx(2) = (w^2) * x(1) - 2*w*x(4);
  dx(3) = x(4);
  dx(4) = (w^2) * x(3) + 2* w*x(2);
endfunction
