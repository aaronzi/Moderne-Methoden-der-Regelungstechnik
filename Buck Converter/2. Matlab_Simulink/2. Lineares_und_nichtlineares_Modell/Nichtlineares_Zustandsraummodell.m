% EINGABEN
% c           Konstanten als Funktionshandle
% i_pv        Funktionshandle zur Funktion i_pv

% AUSGABEN
% f1 & f2     Zeilen des nichtlinearisierten Zustandsraummodell

function [f1, f2] = Nichtlineares_Zustandsraummodell(c, i_pv)

    % Zeilen für nichtlinearisiertes Zustandsraummodell
    f1 = @(x, D) 1/c.C * i_pv(x(1), S, T_c) - 1/c.C * x(2) * D;
    f2 = @(x, D) 1/c.L * x(1) * D - 1/c.L * c.v_DC;
end