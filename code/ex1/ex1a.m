% SCRIPT FOR EXERCISE 1 PART A

% Initialise globals
globals

% Solve system using ode45
[t, SIR] = ode45(@deter_sir, tspan, N0);

% Plot S, I, R over time.
sir_plot(t, SIR)
legend('Susceptible', 'Infected', 'Recovered', 'Total')