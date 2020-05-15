%%%%%%%%%%%%%%%%%%%%%%%%

% 2019-11-05

% HARMONIC OSCILLATOR HAMILTONIAN
% FROM SUSSKIND'S "THE THEORETICAL MINIMUM

% ISAAC AYALA

%%%%%%%%%%%%%%%%%%%%%%%%



% DATA

function HamiltonianHarmonicOscillator
  
  clc
  clear
  close all
  
  for n=0:1:5  % Initial condition range set from -10 to 10
    
    % Store initial conditions in matrix x0
    x0 =  [n;n;];
    
    % Use of ODE45 solver to numerically integrate the ODE
    [t,x]=ode45(@oscillator,[0 30],x0); % [time, state variables]
    
    
    figure(1) % Plot t, x(t)
    hold on
    plot(t,x(:,1),'-+k');
    
    xlabel('Tiempo: [s]','fontsize',14);
    ylabel('p','fontsize',14);
    title('Solución al sistema para p','fontsize',20)
    
    figure(2) % Plot t, y(t)
    hold on
    plot(t,x(:,2),'-*k');
    
    xlabel('Tiempo: [s]','fontsize',14);
    ylabel('x','fontsize',14);
    title('Solución al sistema para x','fontsize',20)
    
    
        
    figure(10) % Plot x(t), x'(t)
    hold on
    plot(x(:,1),x(:,2),'k','LineWidth',2);
    
    xlabel('p :','fontsize',14);
    ylabel("x",'fontsize',14);
    title('Diagrama fase','fontsize',20)
    
    hold off
endfor
  
  
endfunction

function dx = oscillator(~,x)
  k = 0.5;
  m = 1;
  
  %p = x(1);
  %q = x(2);
 
  
  %dx(1) = sqrt(k/m)*q; % p'
  %dx(2) = p/m; % q' 
  
  dx(2) = -k*x(1);
  dx(1) = x(2)/m;
  
  
endfunction




