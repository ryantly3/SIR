%plot model vs data infected individuals
xdata=[161;188;201;236;325;394;558;608;997;1281;1912;3125;3801;4327;4538;3954;4334;4278;3990;3327;2649;1837;1486;1275;1012;982;821;596;436;329;247;118;69;56;28;25;22;14;9;21;23;29;18;21;20;23;45;18;36;48;46;36];
[x,fval]=fminsearch(@lst_sir,[3.9928,3.5170],[],xdata);

N = 106487;
i0=161;
s0=N-i0;
r0=N-i0-s0;
time=[1:1:52];
[t,y] = ode23(@sir,time,[s0,i0,r0],[],x(1),x(2),0,N);

plot(t,y(:,2),'r','Linewidth',2,'DisplayName','Continuous SIR');
hold on
plot(t,xdata(:),'o','Linewidth',2,'DisplayName','CDC Data');
xlabel('Time');
ylabel('Number of Infected Individuals');
%title('Continuous SIR Best Fit')
legend(gca,'show','location','northeastoutside');
