function q = ikineAarmSW(robot, T)
pe = T2Coords(T);
pw = pe(1:3) + [0 0 robot.d(6)];
q(1:3) = ikineAarm(pw, [0 robot.a(2) robot.d(4)], 'sbeu');
q(3) = q(3) + pi/2;
R = t2r(T);
R03 = t2r(SerialLink(robot.links(1:3)).fkine(q(1:3)));
R36 = R03'*R;
q(4:6) = ikineSW(R36, '-pi0');
end

