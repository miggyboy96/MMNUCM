% SCRIPT FOR EXERCISE 2 PART B II

% Initialise variables
globals
ns = 3000;
deaths = zeros(1,ns);
T = 150;

% Run stochastic simulation and find death toll of epidemic
for k=1:ns
    [t, SIR] = stoch_sir(T, N0);
    deaths(k) = sum(N0) - sum(SIR(end,:));
end

% Plot death toll
txt = strcat("mean death toll = ", num2str(mean(deaths)));
histogram(deaths)
ylabel("Count")
xlabel("Death toll")
disp(txt)

% Disregarding small epidemic cases (max infected < 3)
disp("After removing small epidemic cases")
deaths = deaths(deaths > 1);
txt = strcat("altered mean death toll= ", num2str(mean(deaths)));
xline(mean(deaths),LineStyle="--",LineWidth=2,Color='r')
text(0.5,0.95,txt,'Units','normalized')
disp(txt)