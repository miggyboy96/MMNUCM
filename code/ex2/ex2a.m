% SCRIPT FOR EXERFCISE 2 PART A

% Initialise variables
globals

hold on
for k = 1:2
% Solve stochastic SIR model
[t, SIR] = stoch_sir(tspan(2),[100, 1, 0]);

% Plot solutions
sir_plot(t, SIR)
legend('Susceptible', 'Infected', 'Recovered', 'Total')
end
hold off

% Large sample size to compare between the deterministic model
a = 0.6;
col = [a, a, 1; 1, a, a; a, 1, a; a, a, a];
ns = 30;
figure
hold on
for k=1:ns
[t, SIR] = stoch_sir(tspan(2),N0);
S = SIR(:,1);
I = SIR(:,2);
R = SIR(:,3);
N = S + I + R;
plot(t, S, Color=col(1,:))
plot(t, I, Color=col(2,:))
plot(t, R, Color=col(3,:))
plot(t, N, Color=col(4,:))
end
[t, SIR] = ode45(@deter_sir, tspan, N0);
sir_plot(t, SIR)