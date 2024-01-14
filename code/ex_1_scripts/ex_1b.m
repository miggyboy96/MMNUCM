% SCRIPT FOR EXERCISE 1 PART B
% Running with beta = 10000 gives same maximum as beta = 2 of 9.18
% deaths.

% Initialising variables
globals
betas = 0:0.1:2;
tspan = [0, 30];
palette = flipud(abyss(length(betas)));

for i=1:length(betas)
    global beta
    beta = betas(i);
    [t, SIR] = ode45(@deter_sir, tspan, N0);
    D = sum(N0) - sum(SIR,2); % Deaths D(t) = N0 - N(t)
    col = palette(i,:);
    hold on
    plot(t,D, 'LineWidth',1.5,'Color', col)
end

% Plot options
xlabel('Time since start of epidemic')
ylabel('Number of deaths')
colormap(palette);
c = colorbar;
c.Ticks = [0, 0.5, 1];  % Specify the position of ticks (0 at the top, 0.5 in the middle, 1 at the bottom)
c.TickLabels = {'\beta = 0', '\beta = 1', '\beta = 2'};  % Specify tick labels