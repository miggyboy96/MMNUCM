% SCRIPT FOR EXERCISE 2 PART A

% Initialise variables
globals
a = 0.6;
col = [a, a, 1; 1, a, a; a, 1, a; a, a, a];
ns = 30;


hold on
for k=1:ns
[t, SIR] = stoch_sir(tspan(2),N0);
S = SIR(:,1);
I = SIR(:,2);
R = SIR(:,3);
N = S + I + R;
plot(t, S, Color=col(1,:))
plot(t, I, Color=col(2,:))
plot(t, R, Color=col(3,:))
plot(t, N, Color=col(4,:))
end
ex_1a