function plotTraj(eTraj, dTraj)
type = '';
ecoords = T2Coords(eTraj);
figure('name', strcat(type, 'EF Positions'));
dcoords = T2Coords(dTraj);
plot(dcoords(:,1:3));
hold on
plot(ecoords(:,1:3));
title(strcat(type, 'EF Positions'))
legend({'des.x', 'des.y', 'des.z','eff.x', 'eff.y', 'eff.z'})
figure('name', strcat(type, 'EF Orientations'));
coords = T2Coords(dTraj);
plot(coords(:,4:5));
hold on 
plot(ecoords(:,4:5));
title(strcat(type, 'EF Orientations'))
legend({'des.Roll', 'des.Pitch', 'eff.Roll', 'eff.Pitch'})
end

