% Deterministic Continuous
% SIR Epidemic Model
clear
beta=1.1837;
b=0;
gamma=0.8691;
N = 106487;
i0=161;
s0=N-i0;
r0=N-i0-s0;
time=[0:1:52];

[t,y] = ode23(@sir,time,[s0,i0,r0],[],beta,gamma,b,N);

plot(t,y(:,1),'r','Linewidth',2);
hold on
plot(t,y(:,2),'b','Linewidth',2);
plot(t,y(:,3),'y','Linewidth',2);
title('Deterministic');
xlabel('Time');
ylabel('Number of Individuals');
legend('susceptible','infected','recovered','location','northeastoutside');