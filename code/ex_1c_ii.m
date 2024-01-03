% Effects of reinfection

% Initial condition
N0 = [100; 1; 0];

% Parameter values
global beta gamma mu theta
beta = 2;
gamma = 0.1;
mu = 0.01;
theta = 0.08;

% Solve system using ode45
tspan = [0 100];
[t, y] = ode45(@reinfection_fun, tspan, N0);

S = y(:,1); 
I = y(:,2);
R = y(:,3);
N = S + I + R;

% Plot S, I, R over time.
fig_1c_ii = figure('Name','Question 1c ii');
hold on
plot(t,S,'Color','b','LineWidth',1.5)
plot(t, I,'Color','r','LineWidth',1.5)
plot(t, R, 'Color','g','LineWidth',1.5)
plot(t, N,'Color','k','LineStyle','--')
legend('Susceptible S(t)', 'Infected I(t)', 'Recovered R(t)', 'Total N(t)')
xlabel('Time since start of epidemic')
ylabel('Amount of individuals')