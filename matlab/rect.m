function points = rect(dl_corner, b, h)
sp = dl_corner;
points = [sp; sp + [0 h 0]; sp + [b h 0]; sp + [b 0 0]; sp];
end

