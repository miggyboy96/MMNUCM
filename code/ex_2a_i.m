% Compound poisson processes

global beta gamma mu;
beta = 2;
gamma = 0.1;
mu = 0.01;
z=0.2;

ns = 2;
for k=1:ns
    T = 30; % time cap on simulation
    t = 0; % Initialising the time variable
    tvec = t; % initialising time vector
    
    % Initialising SIR variables and vectors
    S_n = 100;
    S_vec = S_n;
    I_n = 1;
    I_vec = I_n;
    R_n = 0;
    R_vec = R_n;
    N_n = S_n + I_n + R_n;
    N_vec = N_n;
    while t<T
        rate_infect = beta * S_n * I_n / N_n;
        rate_death = mu * I_n;
        rate_recover = gamma * I_n;
        tau_infect = exprnd(1/rate_infect); % time till next infection
        tau_death = exprnd(1/rate_death); % time till next death
        tau_recover = exprnd(1/rate_recover); % time till next recovery
        if tau_infect < tau_death && tau_infect < tau_recover
            S_n = S_n - 1; % individual no longer susceptible
            I_n = I_n + 1; % individual is now infected
            t = t + tau_infect;
        elseif tau_death < tau_infect && tau_death < tau_recover
            I_n = I_n - 1; % individual no longer susceptible. dies.
            t = t + tau_death;
        else
            I_n = I_n - 1; % individual no longer infected
            R_n = R_n + 1; % individual is now recovered
            t = t + tau_recover;
        end
        N_n = S_n + I_n + R_n;
        N_vec = [N_vec, N_n];
        S_vec = [S_vec, S_n];
        I_vec = [I_vec, I_n];
        R_vec = [R_vec, R_n];
        tvec = [tvec, t];
    end
    % Plotting results
    hold on
    plot(tvec(1:end-1), S_vec(1:end-1),'Color',[z z 1],'LineWidth',1.5)
    plot(tvec(1:end-1), I_vec(1:end-1),'Color',[1 z z],'LineWidth',1.5)
    plot(tvec(1:end-1), R_vec(1:end-1),'Color',[z 1 z],'LineWidth',1.5)
    plot(tvec(1:end-1), N_vec(1:end-1),'Color',[z z z],'LineStyle','--','LineWidth',1.5)
    ylim([0 105])
end
legend('Susceptible S(t)', 'Infected I(t)', 'Recovered R(t)', 'Total N(t)')
xlabel('Time since start of epidemic')
ylabel('Amount of individuals')



