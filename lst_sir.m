%Least Squares best fit of SIR model
function J = lst_sir(p,xdata)
N = 106487;
i0=161;
s0=N-i0;
r0=N-i0-s0;
time=[1:1:52];

[t,y] = ode23(@sir,time,[s0,i0,r0],[],p(1),p(2),0,N)
errx=y(:,2)-xdata(:,1);
J = errx'*errx;

end