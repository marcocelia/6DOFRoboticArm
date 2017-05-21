function moveMan(robot, q)

n = size(q,1);
for i=1:n
    robot.plot(q(i,:), 'workspace', [-100 150 -50 150 -50 150]);
end

end