% EINGABEN
% x_Ruhe        Ruhelage als Zeilenvektor
% D             Duty Cycle
% delta_i_pv    Funktionshandle zur Funktion delta_i_pv
% S             Eingangsstrahlung auf PV-Zellen
% T_c           Temperatur der Zellen
% L_buck        Induktivitätswert
% C_buck        Kapazitätswert

% AUSGABEN
% A             linearisierte Systemmatrix A
% B             linearisierte Eingangsmatrix B
% C             linearisierte Ausgangsmatrix C
% D             linearisierte Störungsmatrix D

function [A, B, C, D] = Lineares_Zustandsraummodell(x_Ruhe, D, delta_i_pv, S, T_c, L_buck, C_buck)

    % Linearisierung
    A = [(1/C_buck)*delta_i_pv(x_Ruhe(1), S, T_c) -(1/C_buck)*D; (1/L_buck)*D 0];
    B = [-(1/C_buck)*x_Ruhe(2); (1/L_buck)*x_Ruhe(1)];
    C = [1 0; 0 1];
    D = 0;
end