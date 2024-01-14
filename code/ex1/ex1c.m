% SCRIPT FOR EXERFCISE 1 PART C

% Initialising variables
globals
N0 = [N0, 0];
nus = 0:1:10; % values of nu
palette = copper(length(nus)); % graph colors
tspan = [0, 50];

% Solve system using ode45
[t, SIR] = ode45(@vaccine_deter_sir, tspan, N0); % nu = 5 the vaccination rate

% Plot S, I, R, V over time.
sir_plot(t, SIR)
legend('Susceptible', 'Infected', 'Recovered', 'Vaccinated','Total')
title("Vaccination SIRV")


% Number of deaths given different values of nu
figure
for i=1:length(nus)
    global nu
    nu = nus(i);
    [t, SIR] = ode45(@vaccine_deter_sir, tspan, N0);
    D = 101 - sum(SIR,2); % Death D(t) = N0 - N(t)
    col = palette(i,:);
    hold on
    plot(t,D,'Color', col, 'LineWidth',1.5)
end

% Plot options
xlabel('Time since start of epidemic')
ylabel('Number of deaths')
colormap(palette);
c = colorbar;
c.Ticks = [0, 0.5, 1];  % Specify the position of ticks (0 at the top, 0.5 in the middle, 1 at the bottom)
c.TickLabels = {'\nu = 0', '\nu = 5', '\nu = 10'};  % Specify tick labels

% Reinfection
figure
globals

% Solve system using ode45
[t, SIR] = ode45(@reinfect_deter_sir, tspan, N0); % theta = 0.5; the reinfection rate

% Plot S, I, R over time.
sir_plot(t,SIR)
legend('Susceptible S(t)', 'Infected I(t)', 'Recovered R(t)', 'Total N(t)')
title("Reinfection SIRS")