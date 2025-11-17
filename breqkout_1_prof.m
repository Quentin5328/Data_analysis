syms tc fc;
fc = sin(tc)

fplot (fc,[0,2*pi],'r-')

nt = 21;
td = linspace(0,2*pi,21);
fd= sin(td);

hold on;
plot(td,fd,'ko')

