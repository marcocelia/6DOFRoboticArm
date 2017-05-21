function thetaj = ikineAarm(pw1_, a, conf)
c3 = (pw1_(1)^2 + pw1_(2)^2 + pw1_(3)^2 - a(2)^2 - a(3)^2)/(2*a(2)*a(3));
s3p = sqrt(1-c3^2);
s3m = -sqrt(1-c3^2);
theta31 = atan2(s3p,c3);
theta32 = atan2(s3m,c3);
theta21 = atan2((a(2)+a(3)*c3)*pw1_(3)-a(3)*s3p*sqrt(pw1_(1)^2+pw1_(2)^2) , ... 
                (a(2)+a(3)*c3)*sqrt(pw1_(1)^2+pw1_(2)^2)+a(3)*s3p*pw1_(3));
theta22 = atan2((a(2)+a(3)*c3)*pw1_(3)+a(3)*s3p*sqrt(pw1_(1)^2+pw1_(2)^2) , ...
                -(a(2)+a(3)*c3)*sqrt(pw1_(1)^2+pw1_(2)^2)+a(3)*s3p*pw1_(3));
theta23 = atan2((a(2)+a(3)*c3)*pw1_(3)-a(3)*s3m*sqrt(pw1_(1)^2+pw1_(2)^2) , ...
                (a(2)+a(3)*c3)*sqrt(pw1_(1)^2+pw1_(2)^2)+a(3)*s3m*pw1_(3));
theta24 = atan2((a(2)+a(3)*c3)*pw1_(3)+a(3)*s3m*sqrt(pw1_(1)^2+pw1_(2)^2) , ...
                -(a(2)+a(3)*c3)*sqrt(pw1_(1)^2+pw1_(2)^2)+a(3)*s3m*pw1_(3));
theta11 = atan2(pw1_(2), pw1_(1));            
theta12 = atan2(-pw1_(2), -pw1_(1));      
if (strcmp(conf, 'sbed'))
    thetaj = [theta11, theta21, theta31];
elseif (strcmp(conf, 'sbeu'))
    thetaj = [theta11, theta23, theta32];
elseif (strcmp(conf, 'sfed'))
    thetaj = [theta12, theta22, theta31];
elseif (strcmp(conf, 'sfeu'))
    thetaj = [theta12, theta24, theta32];
end