%% KONSTANTEN
function c = Konstanten()
    c.l = 0.4;        % Länge des Pendels in m
    c.m = 0.26;       % Gewicht des Pendels in kg
    c.M = 3;          % Gewicht des Schlittens in kg
    c.F_C = 16;       % Coulombsche Reibung in kg*m*s^-2
    c.d = 7;          % Dämpfungskoeffizient des Schlittens in kg/s
    c.d_Mf = 9.5e-4;  % Lagereibung in kg*m*s^-2
    c.g = 9.81;       % Erdbeschleunigung in m*s^-2
end