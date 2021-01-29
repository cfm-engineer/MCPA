function MCPAJ(length, loops)

% 

%
clc 

force=0.5E-31; %kg*m/s^2 

delta_T=1E-6;

total_T=0; 

electron.m=1.109E-31; %kg 

electron.x=zeros(1,length); % for a single electron initalized at postion in x 

electron.v=zeros(1,length);% for a single electron initalized at position in v 

electron.drift_v=zeros(1,length); % for a single electrons drift velocity

M_Force=force/electron.m; % this should be acceleration rather than force 


figure(1)

xGraph = subplot(2,1,1);

% plot(xGraph, electron.x, total_T,'rx');

xGraphTitle = title('Position vs rate of Random scatters','Interpreter' , 'Latex'); 

xGraphXlabel = xlabel('Time (s)', 'Interpreter', 'Latex');

xGraphYlabel = ylabel('Position (m)', 'Interpreter', 'Latex');

hold on 

vGraph = subplot(2,1,2);



vGraphTitle = title('Velocity vs. Time of Randomly Scattering Electron, v = ', 'Interpreter', 'Latex');

vGraphXlabel = xlabel('Time (s)', 'Interpreter', 'Latex');

vGraphYlabel = ylabel('Velocity ($\frac{m}{s}$)', 'Interpreter', 'Latex');

hold on

electron.v=0;
electron.x=0;
total_T = 0;

plot(electron.v,total_T,'rx'); hold on

for i = 1:(loops) 
    
%     for j=1:(length)
        
        total_T= total_T + delta_T; 
        
        electron.v = electron.v + M_Force*delta_T; % associates with new electron velocity v given the equation v(t)=vo +qE/m*T 
      
        electron.x = electron.x + electron.v .* delta_T; %finds the new position with respect to velocity time where is this equation associated to in the slides ? 
        
         
%         if(j==1)
            plot(xGraph, total_T,electron.x(1), 'rx');
            
            hold on 
            
            plot(vGraph, total_T, electron.v(1), 'bx');
            
            hold on 
            
            title([' Velocity vs Rate of randomly scattering Electron , V= ' num2str(mean(electron.x(1)/total_T))], 'interpreter' , 'latex');
            
%         end 
        
        if(rand() < 0.05)%0.05 at each time step, and if scatter happened 
            electron.v(1)=0; 
        end
        
%     end
    
%     if((loops), 100) == 0 
%         
%         fprintf('%i\n', i);
%         
%     end
%     
    pause(0.01); 
    
end

for i=1:(length)
    electron_drift_v(i)= electron_x(i)/total_T % this eqaution associates to the change in electron displacement DeltaX/DeltaT=Vdx
end 

title(['Velocity Vs Rate of randomly Scatter Electron, v=' num2str(mean(electron_drift_v))], 'Interpreter', 'Latex');

fprintf('Done \n'); 
end
        
        
        




