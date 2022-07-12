%% VOREINSTELLUNGEN
clear;
clc;
warning('off','all')


%% ORDNER HINZUFÜGEN
addpath('./1. Konstanten/', '2. Lineares_und_nichtlineares_Modell\', '3. Steuerbarkeit\');


%% KONSTANTEN
global c;                   % Konstanten als global deklarieren
c = Konstanten();           % Konstanten aufrufen


%% NOTWENDIGE GLEICHUNGEN
i_ph = @(S, T_c) (S/c.S_STC) * c.i_ph_sc_STC * (1 + c.alpha_T * (T_c - c.T_c_STC));
i_d = @(x1, S, T_c) i_s(S, T_c) * (exp(x1/(c.N_s * c.v_T_STC * c.A_n)) - 1);
i_s = @(S, T_c) (i_ph(S, T_c) - (c.v_oc_STC/c.R_h))/(exp(c.v_oc_STC/(c.A_n * c.v_T_STC)) - 1);

i_pv = @(x1, S, T_c) c.N_p * (i_ph(S, T_c) - i_d(x1, S, T_c) - x1/(c.N_s * c.R_h));
delta_i_pv = @(x1, S, T_c) -c.N_p/(c.N_s * c.v_T_STC * c.A_n) * i_s(S, T_c) * exp(x1/(c.N_s * c.v_T_STC * c.A_n)) - (c.N_p/(c.N_s * c.R_h));


%% ZUSTANDSRAUMMODELL (NICHT LINEARISIERT)
syms x [2 1];               % symbolische (2x1)-Matrix
syms D;                     % symbolische Duty Cycle
[f1, f2] = Nichtlineares_Zustandsraummodell(i_pv);


%% ZUSTANDSRAUMMODELL (LINEARISIERT) 
v_PV = 1049.1;
i_L = 2902.1;
D = c.v_DC/v_PV;	        % Duty Cycle
x_Ruhe = [v_PV; i_L];       % Ruhelage
S = 800;                    % Eingangsstrahlung
T_c = 290;                  % Zellentemperatur

[A, B, C] = Lineares_Zustandsraummodell(c, x_Ruhe, D, delta_i_pv, S, T_c);


%% ÜBERPÜRFUNG DER STEUERBARKEIT
[Q] = Steuerbarkeit(A, B);

%{
%% ZUSTANDSREGELUNG OHNE FOLGEREGELUNG - EINFACHE RÜCKFÜHRUNG
sP_Acker = [-4 -4 -4 -4];               % Wunschpolstellen für Regelung mit einfacher Rückführung
k_Acker = Ackermann(A, B, sP_Acker);    % Berechnung der Faktoren k für Regelung mit einfacher Rückführung
C_Acker = [0 0 1 0];                    % Ausgangsmatrix C für Regelung mit einfacher Rückführung

%{
% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(-4+0j), imag(-4+0j), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;
%}


%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - VORSTEUERUNG
sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];            % Wunschpolstellen für Regelung mit Vorsteuerung
k_Vorsteuerung = Ackermann(A, B, sP_Vorsteuerung);  % Berechnung der Faktoren k für Regelung mit Vorsteuerung
C_Vorsteuerung = [0 0 1 0];                         % Ausgangsmatrix C für Regelung mit Vorsteuerung
F = (C_Vorsteuerung*(-A+B*k_Vorsteuerung)^-1*B)^-1; % Berechnung des Faktors F

%{
% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(-4.5+0j), imag(-4.5+0j), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;
%}


%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - I-REGELUNG
sP_I_Regelung = [-3.2 -3.2 -3.2 -3.2 -3.2];                                     % Wunschpolstellen für Regelung mit I-Regelung
C_I_Regelung = [0 0 1 0];                                                       % Ausgangsmatrix C für Regelung mit I-Regelung
[k_Tilde, A_Tilde, B_Tilde] = Tilde_SISO(A, B, C_I_Regelung, sP_I_Regelung);    % Berechnung der Faktoren k_Tilde

%{
% Lokalisierung der Polstellen
hold on;
plot(real(eig(A)), imag(eig(A)), "bx", "LineWidth", 2);
plot(real(-3.2+0j), imag(-3.2+0j), "rx", "LineWidth", 2);
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Eigenwerte der Systemmatrix", "Wunschpolstellen", "Location", "northeast");
grid on;
hold off;
%}


%% Beobachtbarkeit
[Q_obs] = Beobachtbarkeit(A, C);


%% k-Faktoren LMI (I-Regelung)
% für exponentielle Stabilität
C_k_LMI = [0 0 1 0];
alpha = 0.6;

% A_Tilde_Vektor
A_Tilde = A;
A_Tilde = horzcat(A_Tilde, zeros(size(A,1),1));
A_Tilde = vertcat(A_Tilde, [-C_k_LMI 0]);
    
% B_Tilde_Vektor
B_Tilde = [B; 0];

[k_LMI_Tilde, k_LMIsys] = LMI_Berechnung_k(A_Tilde, B_Tilde, alpha);
sP_LMI = eig(A_Tilde-B_Tilde.*k_LMI_Tilde);


%{
% Plot der Polstellen
plot(sP_LMI,'*');
grid on
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Polstellen des Systems", "Location", "northeast");
%}


%% Beobachterentwurf (LMI's)
% für exponentielle Stabilität
alpha = 4;

[L_LMI, L_LMIsys] = LMI_Berechnung_L(A, C ,alpha);
sP_Obs = eig(A-L_LMI*C);


%{
% Plot der Polstellen
plot(sP_Obs, '*');
grid on;
xlabel("Real(x)");
ylabel("Imag(x)");
title("Lokalisierung der Polstellen");
legend("Polstellen des Beobachters", "Location", "northeast");
%}

%}