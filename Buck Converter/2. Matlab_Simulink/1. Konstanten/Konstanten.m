% EINGABEN
%   -

% AUSGABEN
%   c       Konstanten

function c = Konstanten()
    % Sonstiges
    c.N_p = 336;                        % Anzahl serieller Zellen
    c.N_s = 1944;                       % Anzahl paralleler Zellen
    c.k = 1.381e-23;                    % [J/K]
    c.q = 1.602e-19;                    % [As]
    c.A_n = 1.374;                      % [m^2]
    c.alpha_T = 0.06e-2;                % Temperaturkoeffizient für PV-Strom
    c.beta_T = -0.36e-2;                % Temperaturkoeffizient für PV-Spannung
    c.v_DC = 900;                       % [V]
    
    % Standard-Bedingungen
    c.T_c_STC = 298;                    % [K]
    c.S_STC = 1000;                     % [W/m^2]
    c.v_T_STC = 25.7e-3;                % [V] => c.v_T_STC = (c.k*c.T_c_STC)/c.q; 
    c.i_ph_sc_STC = 9.272;              % [A]
    c.v_oc_STC = 0.644;                 % [V]

    % Maximalwerte
    c.i_PV_MPP = 2902.13;               % [A]
    c.v_VP_MPP = 1049.13;               % [V]
    c.p_MPP = 30447.11;                 % [W] => c.p_MPP = c.v_PV_MPP * c.i_PV_MPP 

    % Bauteile
    c.R_h = 10.196;                     % [Ohm]
end