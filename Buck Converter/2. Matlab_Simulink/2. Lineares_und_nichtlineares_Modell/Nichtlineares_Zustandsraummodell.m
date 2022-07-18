% EINGABEN
% c           Konstanten als Funktionshandle
% i_pv        Funktionshandle zur Funktion i_pv

% AUSGABEN
% f1 & f2     Zeilen des nichtlinearisierten Zustandsraummodell

function [f1, f2] = Nichtlineares_Zustandsraummodell(c, i_pv)

    % Zeilen für nichtlinearisiertes Zustandsraummodell
    f1 = @(x, d) 1/C * i_pv(x(1), S, T_c) - 1/C * x(2) * d;
    f2 = @(x, d) 1/C * x(1) * d - 1/L * c.v_DC;
end