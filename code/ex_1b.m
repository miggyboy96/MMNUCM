% Initial condition
N0 = [100; 1; 0];

% Constant parameter values
global gamma mu
gamma = 0.1;
mu = 0.01;

% Values of beta
betas = [0:0.1:2];

% Solving system under different betas
tspan = [0 50];
palette = flipud(abyss(length(betas)));
for i=1:length(betas)
    global beta
    beta = betas(i);
    [t, y] = ode45(@sir_fun, tspan, N0);
    N = y(:,1) + y(:,2) + y(:,3);
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
c.TickLabels = {'\beta = 0', '\beta = 1', '\beta = 2'};  % Specify tick labels

%legend([qw{:}], {'\beta = 0','\beta = 2'}, 'location', 'northwest')





