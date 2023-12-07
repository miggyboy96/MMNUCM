function f = sir_fun(t, X)
%SIR_FUN The SIR model shown in question 1.
global beta gamma mu
S = X(1);
I = X(2);
R = X(3);
N = S + I + R;
dSdt = -beta * I * S / N;
dIdt = (beta * I * S / N) - I*(gamma + mu);
dRdt = gamma * I;
f = zeros(3,1);
f(1) = dSdt;
f(2) = dIdt;
f(3) = dRdt;
end

