% SCRIPT FOR EXERCISE 2 PART B I

% Initialising variables
globals
ns = 3000;
duration = zeros(1,ns);
T = 150;

% Run stochastic simulation and find duration of epidemic
for k=1:ns
    [t, SIR] = stoch_sir(T, N0);
    duration(k) = t(end);
end

% Plot duration time and find mean
txt = strcat("mean duration = ", num2str(mean(duration)));
histogram(duration)
ylabel("Count")
xlabel("Duration of epidemic")
disp(txt)

% Disregarding small epidemic cases (max infected < 3)
disp("After removing small epidemic cases")
duration = duration(duration > 4);
txt = strcat("altered mean duration= ", num2str(mean(duration)));
xline(mean(duration),LineStyle="--",LineWidth=2,Color='r')
text(0.5,0.95,txt,'Units','normalized')
disp(txt)