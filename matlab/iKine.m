function [qt, qe, man] = iKine(robot, Ttg)
steps = size(Ttg,3);
qt = zeros(steps, size(robot.qlim,1));
man = zeros(1, size(robot.qlim,1));
for i=1:steps
    qt(i,:) = ikineAarmSW(robot, Ttg(:,:,i));
    man(i) = robot.maniplty(qt(i,:));
end
qe = qt(steps,:);
end

