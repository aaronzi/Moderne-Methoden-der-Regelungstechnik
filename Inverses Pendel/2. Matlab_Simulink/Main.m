%% VOREINSTELLUNGEN
clear;
clc;
warning('off','all')


%% ORDNER HINZUFÜGEN
addpath('./1. Konstanten/', './2. Lineares_und_nichtlineares_Modell/', './3. Steuerbarkeit/');
addpath('./4. Ackermann-Formel/', './5. Tildevektoren_SISO/', './6. Beobachtbarkeit/');
addpath('./7. LMI/', './8. Simulationen/', "./9. Reglervalidierung/");


%% ORDNER HINZUFÜGEN
addpath('./1. Konstanten/', './2. Lineares_und_nichtlineares_Modell/', './3. Steuerbarkeit/');
addpath('./4. Ackermann-Formel/', './5. Tildevektoren_SISO/', './6. Beobachtbarkeit/');
addpath('./7. LMI/', './8. Simulationen/', "./9. Reglervalidierung/");

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
eig(A_Tilde-B_Tilde.*k_LMI_Tilde);


% Plot der Polstellen
plot(eig(A_Tilde-B_Tilde*k_LMI_Tilde),'*');
grid on



%% Beobachterentwurf (LMI's)
% für exponentielle Stabilität
alpha = 4;

[L_LMI, L_LMIsys] = LMI_Berechnung_L(A, C ,alpha);


% Plot der Polstellen
plot(eig(A-L_LMI*C), '*');
grid on;

