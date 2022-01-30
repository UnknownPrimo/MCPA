
%MCPA Task 2 
%Clear figure and command window
clf;
clc;

x = 0; %Initial x-position
v = 0; %Initial electron velocity
y = 0; %Initial y-postion

%Parameters
dt = 1;
F = 1; %Force
m = 1; %Mass
nt = 1000; %Steps
driftvel = 0; %Initial drift velocity
e1 = [x,y]; % electron postion x and y plot

%Loop
for t = 0:dt:nt 
    
    %Drift velocity plot
    subplot(3,1,1);
    plot(e1(1,1),e1(1,1), '.b');
    xlabel('time') 
    ylabel('v')
    hold on
    title(['Drift Velocity:', num2str(driftvel), ' m/s']);
    
    %Electron Position plot
    subplot(3,1,2);   
    plot(repmat(t, 100 ,1),x,'.r');
    hold on;
    xlabel('x') 
    ylabel('v')
    hold on
    title('Electron Position:');
    
    %Electron Velocity plot
    subplot(3,1,3);
    plot(e1(1,1),e1(1,2),'.b');
    xlabel('time') 
    ylabel('x')
    hold on
    title('Electron Velocity:');
    
    dvx = F*dt;
    x = x + dvx;  
    e1(1,1) = e1(1,1) + x*dt;

    dvy = F*dt;
    y = y + dvy;
    e1(1,2) = e1(1,2) + y*dt;
        
        %Compute drift velocity and display on title
        if t > 0   
            driftvel = (sqrt((x)^2+(y)^2))/t; 
        end
 
        hold on
        pause(0.01);
end
           