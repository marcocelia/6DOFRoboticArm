Ts = robot.fkine(q);
c = T2Coords(Ts);
defp = c(1:3);
r = rect(c(1:3)+[0 0 40-c(3)], 50, 50);
r = [defp; r; defp];
stime = 0.01;
sps = [10 70 70 70 70 10];
Ttg = rectraj(r, sps);
for i=1:size(Ttg,3)
    Ttg(:,:,i) = Ttg(:,:,i)*trotx(c(4))*troty(c(5));
end