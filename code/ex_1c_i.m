% Initial condition
N0 = [100; 1; 0; 0];

% Parameter values
global beta gamma mu nu
beta = 2;
gamma = 0.1;
mu = 0.01;
nu = 2;

% Solve system using ode45
tspan = [0 15];
[t, y] = ode45(@mod_sir_fun,tspan, N0);

S = y(:,1); 
I = y(:,2);
R = y(:,3);
V = y(:,4);
N = S + I + R + V;

% Plot S, I, R over time.
fig_1c_1 = figure('Name','Figure 1c.i');
hold on
plot(t,S,'Color','b','LineWidth',1.5)
plot(t, I,'Color','r','LineWidth',1.5)
plot(t, R, 'Color','g','LineWidth',1.5)
plot(t, V, 'Color', [0.7 0 0.7],'LineWidth',1.5)
plot(t, N,'Color','k','LineStyle','--')
legend('Susceptible S(t)', 'Infected I(t)', 'Recovered R(t)','Vaccinated V(t)', 'Total N(t)')
xlabel('Time since start of epidemic')
ylabel('Amount of individuals')
ylim([0 120])

% Number of deaths given different values of nu
nus = 0:1:10;
tspan = [0 10];
palette = flipud(turbo(length(nus)));
fig_1c_ii = figure('Name','Question 1c.ii');
for i=1:length(nus)
    global nu
    nu = nus(i);
    [t, y] = ode45(@mod_sir_fun, tspan, N0);
    N = y(:,1) + y(:,2) + y(:,3) + y(:,4);
    D = 101 - N; % Deaths is the loss of individuals from the original popuation size
    col = palette(i,:);
    hold on
    plot(t,D, 'LineWidth',1.5,'Color', col)
end
xlabel('Time since start of epidemic')
ylabel('Number of deaths')
colormap(palette);
c = colorbar;
c.Ticks = [0, 0.5, 1];  % Specify the position of ticks (0 at the top, 0.5 in the middle, 1 at the bottom)
c.TickLabels = {'\nu = 0', '\nu = 5', '\nu = 10'};  % Specify tick labels




function g = mod_sir_fun(t, X)
global nu
g = sir_fun(0,X) - [nu; 0; 0];
g(4,1) = nu;
end

