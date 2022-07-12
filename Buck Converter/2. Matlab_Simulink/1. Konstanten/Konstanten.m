%% KONSTANTEN
function c = Konstanten()
    % Sonstiges
    c.N_p = 336;                        % Anzahl serieller Zellen
    c.N_s = 1920;                       % Anzahl paralleler Zellen
    c.k = 1.381e-23;                    % [J/K]
    c.q = 1.602e-19;                    % [As]
    c.A_n = 1.374;                      % [m^2]
    c.alpha_T = 6e-4;                   % Temperaturkoeffizient          
    c.v_DC = 900;                       % [V]
    
    % Standard-Bedingungen
    c.T_c_STC = 298;                    % [K]
    c.S_STC = 1000;                     % [W/m^2]
    c.i_ph_sc_STC = 9.272;              % [A]
    c.v_T_STC = (c.k*c.T_c_STC)/c.q;    % [V]
    c.v_oc_STC = 0.644;                 % [V]

    % Bauteile
    c.R_h = 10.196;                     % [Ohm]
    c.C = 0.0165;                       % [F]
    c.L = 0.0017;                       % [H]

 
end