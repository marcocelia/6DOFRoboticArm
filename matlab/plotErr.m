function plotErr(eT, dT)
ec = T2Coords(eT);
dc = T2Coords(dT);
err = dc - ec;
axes = {'X-Axes','Y-Axes','Z-Axes','Roll','Pitch'};
for i=1:5
    figure('name', strcat(axes{i},' error'));
    plot(err(:,i));
end
end

