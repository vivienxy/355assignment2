function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

%%% TASK 1 
% created instance of class and assigned variables 

h = HillTypeMuscle; 
h.resting_length_muscle = resting_length_muscle;
h.resting_length_tendon = resting_length_tendon;
h.f0M = f0M;

%%% TASK 2 

    function a = activate(T)
        if T < 0.5
            a = 0;
        else 
            a = 1;
        end
    end

    function dx1dt = vm_fct(time, norm_lm)
        x1 = norm_lm;
        dx1dt = get_velocity(activate(time), x1, h.norm_tendon_length(x1));
    end

%%% TASK 3 
% dx1dt = vm_fct
% the outputs of ode45 must be named "time" and "norm_lm"

x1_0 = 1; % initial condition 
tspan = [0 T]; % simulation time

rt = RelTol;
at = AbsTol;

options = odeset('RelTol',rt,'AbsTol',at);

[time, norm_lm] = ode45(@vm_fct, tspan, x1_0, options);

%%% TASK 4 
% save the estimated forces in a vector called "forces"

total_length = h.resting_length_muscle + h.resting_length_tendon;
forces = h.get_force(total_length, norm_lm);

%%%% Do not alter the rest (it should not be needed) %%%%%%
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end