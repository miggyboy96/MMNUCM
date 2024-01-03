function f = reinfection_fun(t, X)
% Modified SIR for reinfection
global beta gamma mu theta
S = X(1);
I = X(2);
R = X(3);
N = S + I + R;
dSdt = -beta * I * S / N + theta * R; 
dIdt = (beta * I * S / N) - I*(gamma + mu);
dRdt = gamma * I - theta * R;
f = zeros(3,1);
f(1) = dSdt;
f(2) = dIdt;
f(3) = dRdt;
end

