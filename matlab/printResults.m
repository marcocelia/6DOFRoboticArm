function printResults(robot, qt, Ttg, man, traj, err, joint, mani)
    cT = robot.fkine(qt);
    if strcmp(traj,'traj');
        plotTraj(cT, Ttg);
    end
    if strcmp(err,'err');
        plotErr(cT, Ttg);
    end
    if strcmp(joint,'joint');
        plotJTraj(qt);
    end
    if strcmp(mani ,'man');
        figure('name','Manipulability');
        plot(man);
    end
end

