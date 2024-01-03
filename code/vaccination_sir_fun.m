function f = vaccination_sir_fun(t, X)
%SIR_FUN The SIR model shown in question 1.
global beta gamma mu nu
S = X(1);
I = X(2);
R = X(3);
V = X(4);
N = S + I + R + V;
% Check if S is greater than 0
if S > 0
    dSdt = -beta * I * S / N - nu;
    dIdt = (beta * I * S / N) - I * (gamma + mu);
    dRdt = gamma * I;
    dVdt = nu;
else
    % If S is 0, set nu to 0
    dSdt = 0;
    dIdt = -I * (gamma + mu);
    dRdt = gamma * I;
    dVdt = 0;
end
f = zeros(4,1);
f(1) = dSdt;
f(2) = dIdt;
f(3) = dRdt;
f(4) = dVdt;
end

