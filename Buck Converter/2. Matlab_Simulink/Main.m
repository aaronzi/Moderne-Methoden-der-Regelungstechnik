%% VOREINSTELLUNGEN
clear;
clc;
warning('off','all');


%% ORDNER HINZUFÜGEN
addpath('./1. Konstanten/', '2. Lineares_und_nichtlineares_Modell\', '3. Steuerbarkeit\', '4. Tildevektoren\', '5. LMI', '6. Simulationen\', '7. Reglervalidierung');


%% KONSTANTEN
global c;                   % Konstanten als global deklarieren
c = Konstanten();           % Konstanten aufrufen


%% NOTWENDIGE GLEICHUNGEN
v_oc = @(T_c) c.v_oc_STC * (1 + c.beta_T * (T_c - c.T_c_STC));
i_ph = @(S, T_c) (S/c.S_STC) * c.i_ph_sc_STC * (1 + c.alpha_T * (T_c - c.T_c_STC));
i_s = @(S, T_c) (i_ph(S, T_c) - (v_oc(T_c)/c.R_h))/(exp(v_oc(T_c)/(c.A_n * c.v_T_STC)) - 1);
i_d = @(x1, S, T_c) i_s(S, T_c) * (exp(x1/(c.N_s*c.v_T_STC * c.A_n)) - 1);

i_pv = @(x1, S, T_c) c.N_p * (i_ph(S, T_c) - i_d(x1, S, T_c) - x1/(c.N_s * c.R_h));
delta_i_pv = @(x1, S, T_c) -c.N_p/(c.N_s * c.v_T_STC * c.A_n) * i_s(S, T_c) * exp(x1/(c.N_s * c.v_T_STC * c.A_n)) - (c.N_p/(c.N_s * c.R_h));


%% ZUSTANDSRAUMMODELL (NICHT LINEARISIERT)
syms x [2 1];                                       % symbolische (2x1)-Matrix
syms d;                                             % symbolische Duty Cycle
[f1, f2] = Nichtlineares_Zustandsraummodell(i_pv);


%% ZUSTANDSRAUMMODELL (LINEARISIERT)
% Vorgaben
% v_DC = 900V
d = c.v_DC/c.v_VP_MPP;          % Duty Cycle
S = 800;                        % Eingangsstrahlung
T_c = 290;                      % Zellentemperatur
f_sw = 5e3;                     % Schaltfrequenz

% Ruhelagen
v_PV = c.v_VP_MPP;              % PV-Spannung
i_L = i_pv(v_PV, S, T_c) / d;   % Strom i_L
x_Ruhe = [v_PV; i_L];           % Vektor der Ruhelage

% Berechnung von L & C
delta_i_L = 0.005 * c.i_PV_MPP;                         % Stromschwankungen
delta_v_PV = 0.005 * c.v_VP_MPP;                        % Spannungsschwankungen
L_buck = (c.v_DC * (1 - d))/(delta_i_L * f_sw);         % Berechnung L
C_buck = (c.i_PV_MPP * (1 - d))/(delta_v_PV * f_sw);    % Berechnung C

% Lineares Zustandsraummodell
[A, B, C, D] = Lineares_Zustandsraummodell(x_Ruhe, d, delta_i_pv, S, T_c, L_buck, C_buck);


%% ÜBERPÜRFUNG DER STEUERBARKEIT
[Q] = Steuerbarkeit(A, B);


%% ZUSTANDSREGELUNG OHNE FOLGEREGELUNG - EINFACHE RÜCKFÜHRUNG
alpha = 0.5;
[k_LMI_1, k_LMIsys_1] = LMI_Berechnung_k(A, B, alpha);
sP_LMI_1 = eig(A-B*k_LMI_1);

% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(sP_LMI_1), imag(sP_LMI_1), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;


%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - VORSTEUERUNG
alpha = 0.5;
[k_LMI_2, k_LMIsys_2] = LMI_Berechnung_k(A, B, alpha);
sP_LMI_2 = eig(A-B*k_LMI_2);
C_Vor = [1 0];                         % Ausgangsmatrix C für Regelung mit Vorsteuerung
F = (C_Vor*(-A+B*k_LMI_2)^-1*B)^-1;    % Berechnung des Faktor

% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(sP_LMI_2), imag(sP_LMI_2), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;


%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - I-
C_I_Reg = [1 0];  
[A_Tilde, B_Tilde] = Tilde(A, B, C_I_Reg);
alpha = 0.5;
[k_LMI_3_Tilde, k_LMIsys_3] = LMI_Berechnung_k(A_Tilde, B_Tilde, alpha);
sP_LMI_3 = eig(A_Tilde-B_Tilde*k_LMI_3_Tilde);

% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(sP_LMI_3), imag(sP_LMI_3), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;