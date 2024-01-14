function f = reinfect_deter_sir(t, X)
% Modified SIR for reinfection
global beta gamma mu theta

S = X(1);
I = X(2);
R = X(3);
N = S + I + R;

dSdt = -beta * I * S / N + theta * R; 
dIdt = (beta * I * S / N) - I*(gamma + mu);
dRdt = gamma * I - theta * R;

f = [dSdt; dIdt; dRdt];
end