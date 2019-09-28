% Continuous Time Markov Chain
% SIR Epidemic Model
clear
beta=1.1837;
b=0;
gamma=0.8691;
N=106487;
i0=161;
s0=N-i0;
time=52;
sim=1;
for k=1:sim
    clear t s i r
    t(1)=0;
    i(1)=i0;
    s(1)=s0;
    r(1)=N-i0-s0;
    j=1;
    while i(j)>0 && t(j)<time
        u1=rand; % uniform random number
        u2=rand; % uniform random number
        a=(beta/N)*i(j)*s(j)+(gamma)*i(j)+b*(N-s(j));
        prob0=(beta*i(j)*s(j)/N)/a;
        prob1=(gamma*i(j))/a;
        prob2=(b*i(j))/a;
        prob3=(b*r(j))/a;
        t(j+1)=t(j)-log(u1)/a;
        if u2 <= prob0; 
        i(j+1)=i(j)+1;
        s(j+1)=s(j)-1;
        r(j+1)=r(j);
        elseif prob0 < u2 <= prob1+prob0;
        i(j+1)=i(j)-1;
        s(j+1)=s(j);
        r(j+1)=r(j)+1;
        elseif prob1+prob0 < u2 <= prob2+prob1+prob0;
        i(j+1)=i(j)-1;
        s(j+1)=s(j)+1;
        r(j+1)=r(j);
        else prob2+prob1+prob0 < u2 <= prob3+prob2+prob1+prob0;
        i(j+1)=i(j);
        s(j+1)=s(j)+1;
        r(j+1)=r(j);
        end
        j=j+1;
    end
    %plot(t,s,'r','LineWidth',2)
    hold on
    plot(t,i,'b','LineWidth',2)
    %plot(t,r,'y','LineWidth',2)
    title('CTMC');
    xlabel('Time');
    ylabel('Number of Individuals');
    %legend('Susceptible','Infected','Recovered','location','northeastoutside');
end
