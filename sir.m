%continuous sir model ode
function dydt = sir(t,y,beta,gamma,b,N)
ds = -beta*y(1)*y(2)/N + b*(y(2)+y(3));
di = beta*y(1)*y(2)/N - (b+gamma)*y(2);
dr = gamma*y(2)-b*y(3);
dydt=[ds;di;dr];
end