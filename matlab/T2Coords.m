function [ c ] = T2Coords( T )
    n = size(T, 3);
    c = zeros(n, 6);
    for i=1:n
        c(i, 1:3) = transl(T(:,:,i));
        c(i, 4:6) = tr2rpy(T(:,:,i));
    end
end

