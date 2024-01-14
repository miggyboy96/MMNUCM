% SCRIPT FOR EXERCISE 3 PART B IV

% Initialise variables
globals
T = 120;
ns = 3000;
max_infected = zeros(1,ns);

% Run stochastic simulation and find max infections, and time taken.
for k=1:ns
    [t, SIR] = mod_stoch_sir(T, N0);
    max_infected(k) = max(SIR(:,2));
end

% Estimate probability that max_infected > 10
prob = sum(max_infected > 10) / ns;
disp("P(peak no. of infected > 10), prob")
txt = strcat("prob = ", num2str(prob));
disp(txt)

% Plot maximum infected
histogram(max_infected)
ylabel("Count")
xlabel("Peak number of infected")
xline(10,'LineStyle','--','Color','m','LineWidth',2)
text(0.5,0.95,txt,'Units','normalized')