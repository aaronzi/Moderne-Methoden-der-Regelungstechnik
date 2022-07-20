% EINGABEN
%   -

% AUSGABEN
%   c       Konstanten

function c = Konstanten()
    % Sonstiges
    c.N_cell_p = 1;                     % Anzahl parallelr Zellen pro PV_Modul
    c.N_cell_s = 72;                    % Anzahl serieller Zellen pro PV-Modul
    c.N_mod_p = 336;                    % Anzahl paralleler Module pro PV-Anlage
    c.N_mod_s = 27;                     % Anzahl serieller Module pro PV-Anlage
    c.N_p = 336;                        % Anzahl paralleler Zellen pro PV-Anlage => N_p = N_cell_p * N_mod_p
    c.N_s = 1944;                       % Anzahl serieller Zellen pro PV-Anlage => N_s = N_cell_s * N_mod_s
    c.k = 1.381e-23;                    % Boltzmann Konstante [J/K]
    c.q = 1.602e-19;                    % Elementarladung [C]
    c.A_n = 1.374;                      % Idealitätsfaktor der Diode
    c.alpha_T = 0.06e-2;                % Temperaturkoeffizient für PV-Strom
    c.beta_T = -0.36e-2;                % Temperaturkoeffizient für PV-Spannung
    c.v_DC = 900;                       % Ausgangsgleichspannung [V]
    
    % Standard-Bedingungen
    c.T_c_STC = 298;                    % Zellentemperatur unter Standardbedingungen [K]
    c.S_STC = 1000;                     % Bestrahlung unter Standardbedingungen[W/m^2]
    c.v_T_STC = 25.7e-3;                % thermische Spannung des p-n-Übergangs [V] => c.v_T_STC = (c.k*c.T_c_STC)/c.q; 
    c.i_ph_sc_STC = 9.272;              % Kurzschlussstrom unter Standardbedingungen [A]
    c.v_oc_STC = 0.644;                 % Leerlaufspannung unter Standardbedingungen [V]

    % Maximalwerte
    c.i_PV_MPP = 2902.13;               % Strom im MPP [A]
    c.v_VP_MPP = 1049.13;               % Spannung im MPP [V]
    c.P_MPP = 30447.11;                 % Leistung im MPP [W] => c.p_MPP = c.v_PV_MPP * c.i_PV_MPP 

    % Bauteile
    c.R_h = 10.196;                     % Shunt-Widerstand [Ohm]
end