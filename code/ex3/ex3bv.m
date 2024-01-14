% SCRIPT FOR EXERCISE 3 PART V
% Running at ns = 100000 resulted in v = 30.7

% Initialising variables
globals
T = 15;
v = 50;
ns = 3000;
prob = 1;
N0 = [N0, 0];

while prob > 0.47
    v = v + 0.1;
    % Perform on a sample size of ns
    max_infected = zeros(1,ns);
    for k = 1:ns
        [~, SIRV] = vaccine_mod_stoch_sir(T, N0, v);
        max_infected(k) = max(SIRV(:,2));
    end
    % Calculate probability that peak is greater than 10
    prob = sum(max_infected>10) / ns;
end

disp("Required vaccination rate to half P(max>10)")
txt = strcat("v = ", num2str(v), ", prob = ", num2str(prob));
disp(txt)

% Plot histogram of peak infected
histogram(max_infected, BinWidth=1)
ylabel("Count")
xlabel("Peak number of infected")
xline(10,'LineStyle','--','Color','m','LineWidth',2)
text(0.5,0.95,txt,'Units','normalized')

% Plot one example to demonstate v = 20
[t, SIRV] = vaccine_mod_stoch_sir(30, N0, 30);
figure
sir_plot(t, SIRV)
[a, index] = max(SIRV(:,2));
line([0, t(index)],[a, a],Color='k',LineStyle='--')
text(t(index),a+4,num2str(a))
legend('Susceptible', 'Infected', 'Recovered', 'Vaccinated', 'Total')
xlim([0, t(end)])
hold off