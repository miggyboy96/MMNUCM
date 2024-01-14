function [t, SIR] = stoch_sir(T, X)
% Stochastic SIR model as a compound sum of poisson processes.
% Initialising variables
global gamma beta mu
[S_n, I_n, R_n] = deal(X(1), X(2), X(3));
SIR = [S_n, I_n, R_n];
% Initial time
t = 0;
tvec = 0;
while t<T
    rates = [beta * S_n * I_n / (S_n + I_n + R_n), mu * I_n, gamma * I_n];
    [tau, event] = min(exprnd(1./rates)); % time till next event
    if event == 1 % Infection
        S_n = S_n - 1;
        I_n = I_n + 1;
    elseif event == 2 % Death
        I_n = I_n - 1;
    else % Recovery
        I_n = I_n - 1;
        R_n = R_n + 1;
    end
    t = t + tau;
    SIR = [SIR; S_n, I_n, R_n];
    tvec = [tvec, t];
end
SIR = SIR(1:end-1,:);
t = tvec(1:end-1);
end

