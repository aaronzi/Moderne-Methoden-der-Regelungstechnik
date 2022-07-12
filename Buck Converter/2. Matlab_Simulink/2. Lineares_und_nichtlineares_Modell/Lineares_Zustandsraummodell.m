% EINGABEN
% c             Funktionshandle auf Konstanten
% x_Ruhe        Ruhelage als Zeilenvektor
% D             Duty Cycle
% delta_i_pv    Funktionshandle zur Funktion delta_i_pv
% S             Eingangsstrahlung auf PV-Zellen
% T_c           Temperatur der Zellen

% AUSGABEN
% A             linearisierte Systemmatrix A
% B             linearisierte Eingangsmatrix B
% C             linearisierte Ausgangsmatrix C

function [A, B, C] = Lineares_Zustandsraummodell(c, x_Ruhe, D, delta_i_pv, S, T_c)

    % Linearisierung
    A = [1/c.C*delta_i_pv(x_Ruhe(1), S, T_c) -1/c.C*D; 1/c.L*D 0];
    B = [-1/c.C*x_Ruhe(2); 1/c.L*x_Ruhe(1)];
    C = [1 0; 0 1];
end