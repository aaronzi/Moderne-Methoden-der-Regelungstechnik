% EINGABEN
% c           Konstanten als Funktionshandle

% AUSGABEN
% f1 - f4     Zeilen des nichtlinearisierten Zustandsraummodell

function [f1, f2, f3, f4] = Nichtlineares_Zustandsraummodell(c)

    % Zeilen für nichtlinearisiertes Zustandsraummodell
    f1 = @(x, Fa) x(2);
    f2 = @(x, Fa) ((Fa-c.g*tan(x(1))*(c.M+c.m)-c.d*x(4))/(c.m*c.l*cos(x(1)))+c.d_Mf*x(2)*(c.M/(c.m^2*c.l^2*cos(x(1))^2)+1/(c.m*c.l^2*cos(x(1))^2))+x(2)^2*tan(x(1)))/(1-1/cos(x(1))^2-c.M/(c.m*cos(x(1))^2));
    f3 = @(x, Fa) x(4);
    f4 = @(x, Fa) (c.g*tan(x(1))+1/(c.m*cos(x(1))^2)*(c.d*x(4)-Fa)-(c.l*x(2)^2*tan(x(1)))/cos(x(1))-(c.d_Mf*x(2))/(c.m*c.l*cos(x(1))))/(1-(c.M+c.m)/(c.m*cos(x(1))^2));
end