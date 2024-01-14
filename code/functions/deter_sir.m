function f = deter_sir(t, X)
%SIR_FUN The SIR model shown in question 1.
global beta gamma mu % Initialising globals
dSdt = -beta * X(1) * X(2) / sum(X);
dIdt = beta * X(1) * X(2) / sum(X) - X(2)*(gamma + mu);
dRdt = gamma * X(2);
f = [dSdt; dIdt; dRdt];
end
