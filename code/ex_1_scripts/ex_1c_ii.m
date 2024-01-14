% SCRIPT FOR EXERFCISE 1 PART C

% Initialise variables
globals
tspan = [0 30];

% Solve system using ode45
[t, SIR] = ode45(@reinfect_deter_sir, tspan, N0); % theta = 0.5; the reinfection rate

% Plot S, I, R over time.
sir_plot(t,SIR)
legend('Susceptible S(t)', 'Infected I(t)', 'Recovered R(t)', 'Total N(t)')