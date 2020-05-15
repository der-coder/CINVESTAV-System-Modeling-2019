function ode_example_code
% dirfield(sin_ex01,-2:0.2:2,-2:0.2:2)

% hold on

for y0 = -10:1:10
      % [t,y]=ode23s(@sin_ex01,[0 10],y0);
    [t,y]=ode45(@sin_ex01,[0 10],[y0,y0]); % Changed equation to run in octave
    
    figure(1) % Create figure for sin(y)
    
    hold on
    plot(t,y(:,1),'r','LineWidth',2);
    
    xlabel('Tiempo','fontsize',14);
    ylabel('solucion-x','fontsize',14);
    
    yticks([-4*pi -3*pi -2*pi -pi 0 pi 2*pi 3*pi 4*pi])
    yticklabels({'-4\pi','-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi','4\pi'})
    
    title('Soluciones de dx/dt = sin(x)','fontsize',16);
    
    set(gcf, 'Color', [1 1 1])
    
    figure(2) % Create figure for cos(x)
    
    hold on
    plot(t,y(:,2),'b','LineWidth',2)
    
    xlabel('Tiempo','fontsize',14);
    ylabel('solucion_x','fontsize',14);
    
    yticks([-4*pi -3*pi -2*pi -pi 0 pi 2*pi 3*pi 4*pi])
    yticklabels({'-4\pi','-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi','4\pi'})
    
    title('Soluciones de dx/dt = cos(x)','fontsize',16);
    
    %grid 
    hold off
end

% hold off         

function dy = sin_ex01(~,y)
dy = zeros(1,1);     
dy(1)= sin(y(1));  %t*y^2; 
dy(2) = cos(y(2));
dy=dy';
