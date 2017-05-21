a= [0 100 0 0 0 0];
alpha = [pi/2 0 pi/2 -pi/2 +pi/2 0];
d = [0 0 0 100 0 50];
q = [0.7854    1.8671   -0.2527   -0.0000   -1.614    0.7854];

for i=1:6
    L(i)=Link([0 d(i) a(i)  alpha(i)], 'standard');
end

robot=SerialLink(L, 'name', 'Aarm');

trajGen;
