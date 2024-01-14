% SCRIPT FOR EXERCISE 2 PART B III

% Initialise variables
globals
T = 100;
ns = 3000;
time2max = zeros(1,ns);

% Run stochastic simulation and find max infections, and time taken.
for k=1:ns
    [t, SIR] = stoch_sir(T, N0);
    [max_infected, index] = max(SIR(:,2));
    time2max(k) = t(index);
end

% Plot duration time and find mean
txt = strcat("mean time taken = ", num2str(mean(time2max)));
histogram(time2max)
ylabel("Count")
xlabel("Time taken to reach peak")
disp(txt)

% Disregarding small epidemic cases (max infected < 3)
disp("After removing small epidemic cases")
time2max = time2max(time2max > 1.7);
txt = strcat("altered mean taken= ", num2str(mean(time2max)));
xline(mean(time2max),LineStyle="--",LineWidth=2,Color='r')
text(0.5,0.95,txt,'Units','normalized')
disp(txt)