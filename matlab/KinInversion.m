%%
%   Linear Inverse Kinematics
%
tic;
[qt_ik, qe_ik, man_ik] = iKine(robot, Ttg);
ct_ik = toc;
moveMan(robot, qt_ik);
printResults(robot, qt_ik, Ttg, man_ik, '', 'err', 'joint', 'man');
%%
%   Differential Inverse Kinematics
%
opt = 'noopt';
tic;
[qt_nopt, qe_nopt, man_nopt] = iDiffKine(robot, Ttg, stime, q, opt);
ct_nopt = toc;
printResults(robot, qt_nopt, Ttg, man_nopt, '', 'err', 'joint', 'man');
%moveMan(robot, qt_nopt);
%%
%   Improved Inverse Kinematics
%
opt = 'ikcon';
tic;
[qt_ikcon, qe_ikcon, man_ikcon] = iDiffKine(robot, Ttg, stime, q, opt);
ct_ikcon = toc;
printResults(robot, qt_ikcon, Ttg, man_ikcon, '', 'err', 'joint', 'man');
%moveMan(robot, qt_ikcon);
%%
%   Optimized Inverse Differential Kinematics
%
opt = 'manipulability';
tic;
[qt_opt, qe_opt, man_opt] = iDiffKine(robot, Ttg, stime, q, opt);
ct_opt = toc;
printResults(robot, qt_opt, Ttg, man_opt, '', 'err', 'joint', 'man');
%moveMan(robot, qt_opt);