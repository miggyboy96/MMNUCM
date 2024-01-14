function [t, SIRV] = vaccine_mod_stoch_sir(T, X, v)
% Modification of stoch_sir() to include reinfection and vaccination
% Initialising variables
global gamma beta mu
[S_n, I_n, R_n, V_n] = deal(X(1), X(2), X(3), X(4));
SIRV = [S_n, I_n, R_n, V_n];
% Initial time
t = 0;
tvec = 0;
while t<T
    if S_n == 0
        a = 0;
    else
        a = v;
    end
    rates = [beta * S_n * I_n / (S_n + I_n + R_n), mu * I_n, gamma * I_n, a];
    [tau, event] = min(exprnd(1./rates)); % time till next event
    if event == 1 % Infection
        S_n = S_n - 1;
        I_n = I_n + 1; 
    elseif event == 2 % Death
        I_n = I_n - 1; 
    elseif event == 3 % Recovery
        I_n = I_n - 1;
        flip = rand;
        if flip > 0.5
            R_n = R_n + 1; 
        else
            S_n = S_n + 1;
        end
    else % Vaccination
        V_n = V_n + 1;
        S_n = S_n - 1;
    end
    t = t + tau;
    SIRV = [SIRV; S_n, I_n, R_n, V_n];
    tvec = [tvec, t];
end
SIRV = SIRV(1:end-1,:);
t = tvec(1:end-1);
end