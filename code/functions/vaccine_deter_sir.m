function f = vaccine_deter_sir(t, X)
% ODEs of the extended SIRV model
global beta gamma mu nu % Initialising globals
if X(1) > 0
    v = nu;
else
    v = 0;
end
dSdt = -beta * X(1) * X(2) / sum(X) - v;
dIdt = beta * X(1) * X(2) / sum(X) - X(2)*(gamma + mu);
dRdt = gamma * X(2);
dVdt = v;
f = [dSdt; dIdt; dRdt; dVdt];
end