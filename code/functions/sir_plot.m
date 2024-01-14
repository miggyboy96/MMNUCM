function sir_plot(t,SIR)
%SIR_PLOT Plots the numbers of SIR over time.
colororder(["b", "r", "g", "m"])
plot(t,SIR,LineWidth=1.5) % plots SIR (V)
hold on
N = sum(SIR,2);
plot(t,N,'Color','black','LineStyle','--', 'LineWidth',1.5) % plots N
xlabel('Time since start of epidemic')
ylabel('Number of individuals')
ylim([0 105])
end