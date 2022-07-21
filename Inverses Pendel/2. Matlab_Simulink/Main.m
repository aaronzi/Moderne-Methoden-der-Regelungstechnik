%% VOREINSTELLUNGEN
clear;
clc;
warning('off','all')


%% ORDNER HINZUFÜGEN
addpath('./1. Konstanten/', './2. Lineares_und_nichtlineares_Modell/', './3. Steuerbarkeit/');
addpath('./4. Ackermann-Formel/', './5. Tildevektoren/', './6. Beobachtbarkeit/');
addpath('./7. LMI/', './8. Simulationen/', "./9. Reglervalidierung/");
addpath("9. Reglervalidierung\1. Vergleich_linear_nichtlinear\", "9. Reglervalidierung\2. Einfache_Zustandsrueckfuehrung_linear\");
addpath("9. Reglervalidierung\3. Einfache_Zustandsrueckfuehrung_nichtlinear\", "9. Reglervalidierung\4. Referenzwertvorsteuerung_linear\");
addpath("9. Reglervalidierung\5. Referenzwertvorsteuerung_nichtlinear\", "9. Reglervalidierung\6. I-Regelung_linear\");
addpath("9. Reglervalidierung\7. I-Regelung_nichtlinear\", "9. Reglervalidierung\8. Vergleich_linear\");
addpath("9. Reglervalidierung\9. Vergleich_nichtlinear\", "9. Reglervalidierung\10. Beobachter\", "9. Reglervalidierung\11. Vergleich_Beobachter\");


%% KONSTANTEN
global c;                   % Konstanten als global deklarieren
c = Konstanten();           % Konstanten aufrufen


%% ZUSTANDSRAUMMODELL (NICHT LINEARISIERT)
syms x [4 1];               % symbolische (4x1)-Matrix
syms Fa;                    % symbolische Eingangskraft
[f1, f2, f3, f4] = Nichtlineares_Zustandsraummodell(c);


%% ZUSTANDSRAUMMODELL (LINEARISIERT) 
x_Ruhe = [0; 0; 0; 0];      % Ruhelage
[A, B, C, D] = Lineares_Zustandsraummodell(x, Fa, x_Ruhe, f1, f2, f3, f4);


%% ÜBERPÜRFUNG DER STEUERBARKEIT
[Q] = Steuerbarkeit(A, B);


%% ZUSTANDSREGELUNG OHNE FOLGEREGELUNG - EINFACHE RÜCKFÜHRUNG
sP_Acker = [-4 -4 -4 -4];               % Wunschpolstellen für Regelung mit einfacher Rückführung
k_Acker = Ackermann(A, B, sP_Acker);    % Berechnung der Faktoren k für Regelung mit einfacher Rückführung

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
sP_Vor = [-4.5 -4.5 -4.5 -4.5];                     % Wunschpolstellen für Regelung mit Vorsteuerung
k_Vor = Ackermann(A, B, sP_Vor);                    % Berechnung der Faktoren k für Regelung mit Vorsteuerung
C_Vor = [0 0 1 0];                                  % Ausgangsmatrix C für Regelung mit Vorsteuerung
F = (C_Vor*(-A+B*k_Vor)^-1*B)^-1;                   % Berechnung des Faktors F

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
sP_I_Reg = [-3.2 -3.2 -3.2 -3.2 -3.2];                                     % Wunschpolstellen für Regelung mit I-Regelung
C_I_Reg = [0 0 1 0];                                                       % Ausgangsmatrix C für Regelung mit I-Regelung
[k_Tilde, A_Tilde, B_Tilde] = Tilde(A, B, C_I_Reg, sP_I_Reg);              % Berechnung der Faktoren k_Tilde

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
alpha = 0.6;                    % Decay-Rate

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
alpha = 4;                      % Decay Rate

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
