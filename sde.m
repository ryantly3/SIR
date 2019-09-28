% Stochastic Differential Equation
% SIR Epidemic Model
clear
beta=1.1837;
b=0;
gamma=0.8691;
N=106487;
i0=161;
s0=N-i0;
dt=0.01;
time=52;
sim=1;
for k=1:sim
    clear i t s r
    j=1;
    i(j)=i0;
    s(j)=s0;
    r(j)=N-i0-s0;
    t(j)=dt;
    while i(j)>0 && t(j)<time
        mu_s=-1*beta*s(j)*i(j)/N;
        V=[beta*s(j)*i(j)/N, -1*beta*s(j)*i(j)/N; -1*beta*s(j)*i(j)/N, beta*s(j)*i(j)/N+gamma*i(j)];
        B=sqrt(V);
        mu_i=beta*s(j)*i(j)/N-(gamma)*i(j);
        rn1=randn; % standard normal random number
        rn2=randn;
        s(j+1)=s(j)+mu_s*dt+B(1)*sqrt(dt)*rn1+B(3)*sqrt(dt)*rn2;
        i(j+1)=i(j)+mu_i*dt+B(2)*sqrt(dt)*rn1+B(4)*sqrt(dt)*rn2;
        r(j+1)=N-s(j+1)-i(j+1);
        t(j+1)=t(j)+dt;
        j=j+1;
    end
    %plot(t,s,'r','Linewidth',2);
    hold on
    plot(t,i,'b','Linewidth',2);
    %plot(t,r,'y','Linewidth',2);
    title('SDE');
    xlabel('Time');
    ylabel('Number of Individuals');
    %legend('Susceptible','Infected','Recovered','location','northeastoutside');
end
