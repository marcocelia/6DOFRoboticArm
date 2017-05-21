function thetaj = ikineSW( R36 , conf)
if (strcmp(conf,'0pi'))
    thetaj(1) = atan2(R36(2,3), R36(1,3));
    thetaj(2) = atan2(sqrt(R36(1,3)^2 + R36(2,3)^2), R36(3,3));
    thetaj(3) = atan2(R36(3,2), -R36(3,1));
elseif (strcmp(conf, '-pi0'))
    thetaj(1) = atan2(-R36(2,3), -R36(1,3));
    thetaj(2) = atan2(-sqrt(R36(1,3)^2 + R36(2,3)^2), R36(3,3));
    thetaj(3) = atan2(-R36(3,2), R36(3,1));
end

end

