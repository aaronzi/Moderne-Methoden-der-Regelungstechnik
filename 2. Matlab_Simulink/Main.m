%% VOREINSTELLUNGEN
clear;
clc;

%% KONSTANTEN
global c;                   % Konstanten als global deklarieren
c = Konstanten();           % Konstanten aufrufen

%% ZUSTANDSRAUMMODELL (NICHT LINEARISIERT)
syms x [4 1];               % symbolische (4x1)-Matrix
syms Fa;                    % symbolische Eingangskraft
[f1, f2, f3, f4] = Nichtlineares_Zustandsraummodell(c);

%% ZUSTANDSRAUMMODELL (LINEARISIERT) 
x_Ruhe = [0; 0; 0; 0];     % Ruhelagen
[A, B, C, D] = Lineares_Zustandsraummodell(x, Fa, x_Ruhe, f1, f2, f3, f4);

%% ÜBERPÜRFUNG DER STEUERBARKEIT
[Q, Det_Q] = Steuerbarkeit(A, B);

%% ZUSTANDSREGELUNG OHNE FOLGEREGELUNG - ACKERMANN
sP_Acker = [-4 -4 -4 -4];               % Wunschpolstellen für Regelung mit Ackermann
k_Acker = Ackermann(A, B, sP_Acker);    % Berechnung der Faktoren k für Regelung Ackermann
C_Acker = [0 0 1 0];                    % Ausgangsmatrix C für Regelung Ackermann
% k_Acker = acker(A, B, sP_Acker);	    % Alternative Berechnung der Faktoren k

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

%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - VORSTEUERUNG
sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];                    % Wunschpolstellen für Regelung mit Vorsteuerung
k_Vorsteuerung = Ackermann(A, B, sP_Vorsteuerung);  % Berechnung der Faktoren k für Regelung mit Vorsteuerung
C_Vorsteuerung = [0 0 1 0];                         % Ausgangsmatrix C für Regelung mit Vorsteuerung
F = (C_Vorsteuerung*(-A+B*k_Vorsteuerung)^-1*B)^-1; % Berechnung des Faktors F

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

%% ZUSTANDSRÜCKFÜHRUNG MIT FOLGEREGELUNG - I-REGELUNG
sP_I_Regelung = [-3.2 -3.2 -3.2 -3.2 -3.2];                 % Wunschpolstellen für Regelung mit I-Regelung
C_I_Regelung = [0 0 1 0];                                   % Ausgangsmatrix C für Regelung mit I-Regelung
k_Tilde = Tilde_Vektor(A, B, C_I_Regelung, sP_I_Regelung);  % Berechnung der Faktoren k_Tilde

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