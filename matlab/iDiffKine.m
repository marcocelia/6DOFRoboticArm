function [q, qend, man] = iDiffKine(robot, Ttg, dt, q, opt)
global qcurr;
global dVe;
steps = size(Ttg,3);
qcurr = q;
Tprev = Ttg(:,:,1);
man = zeros(1, steps);
k0 = 0.01;
for i=1:steps
    Tcurr = Ttg(:,:,i);
    prev = T2Coords(Tprev);
    new = T2Coords(Tcurr);
    dVe = (new - prev)/dt;
    dVe = dVe(1:5);
    if strcmp(opt, 'manipulability')
        f = @(x) manipulabilityOF(x, robot, k0, dt);
        [qcurr, man(i)] = optProbl(robot, f, dt, k0);
    elseif strcmp(opt, 'noopt')
        J = robot.jacob0(qcurr);
        J = J(1:5,:);
        J_pinv = J'*((J*J')^-1);
        dqcurr = (J_pinv*dVe')'; 
        qcurr = qcurr + dqcurr*dt;
        J = robot.jacob0(qcurr);
        J = J(1:5,:);
        man(i) = sqrt(det(J*J'));
    elseif strcmp(opt, 'ikcon')
        qcurr = robot.ikcon(Ttg(:,:,i));
        J = robot.jacob0(qcurr);
        J = J(1:5,:);
        man(i) = sqrt(det(J*J'));
    end
    q(i,:) = qcurr;
    Tprev = Tcurr;
end
    qend = qcurr;
end

function [q_new, manVal] = optProbl(robot, optFunction, dt, k0)
    global qcurr;
    global dVe;

    opt = optimoptions('fminunc', 'Algorithm', 'quasi-newton', 'Display', 'off');
    nj = size(robot.qlim, 1);
    dq0 = zeros(1, nj);
    I = eye(nj);
    J = robot.jacob0(qcurr);
    J = J(1:5,:);
    J_pinv = J'*((J*J')^-1);
    [dq0] = fminunc(optFunction, dq0, opt);
    dqcurr = J_pinv*dVe' + (I-J_pinv*J)*dq0'*k0;
    q_new = qcurr + dqcurr'*dt;
    J = robot.jacob0(q_new);
    J = J(1:5,:);
    manVal = sqrt(det(J*J'));
end

function m = manipulabilityOF(dq0, robot, k0, dt)
    global qcurr;
    global dVe;
    
    lqcurr = qcurr;
    J = robot.jacob0(lqcurr);
    J = J(1:5,:);
    nj = size(robot.qlim, 1);
    I = eye(nj);
    J_pinv = J'*((J*J')^-1);
    dq0 = J_pinv*dVe' + (I-J_pinv*J)*dq0'*k0;
    lqcurr = lqcurr + dq0'*dt;
    J = robot.jacob0(lqcurr);
    J = J(1:5,:);
    m = -sqrt(det(J*J'));
end