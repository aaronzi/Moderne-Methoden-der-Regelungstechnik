% EINGABEN
% A           Systemmatrix  
% C           Ausgangsmatrix  
% alpha       Decay-Rate

% AUSGABEN
% L           Verstärkung des Beobachters
% L_LMIsys    Lösung des LMI-System

function [L, L_LMIsys] = LMI_Berechnung_L(A, C, alpha)

% Initialisierung des LMI-Systems
setlmis([]);

% Matrizen P und N spezifizieren
varType_symBlock        = 1;  
varType_fullRectangular = 2;

[n, ~] = size(A);
[p, ~] = size(C);

P = lmivar(varType_symBlock, [n 1]);           % P-Matrix 
N = lmivar(varType_fullRectangular, [n p]);    % N-Matrix

% Terme der LMI spezifizieren
%   A'P + PA - NC - C'N' + 2 alpha P < 0
%   P > 0

lmiterm([1 1 1 P], 1, A, 's');
lmiterm([1 1 1 P], 2*alpha, 1);
lmiterm([1 1 1 N], 1, -C, 's');      
lmiterm([-2 1 1 P], 1, 1);              % P > 0

% LMI lösen
L_LMIsys = getlmis;     

[~, xfeas] = feasp(L_LMIsys); 
 
P_sol = dec2mat(L_LMIsys, xfeas, P);    % Lösung für P
N_sol = dec2mat(L_LMIsys, xfeas, N);    % Lösung für N

L = inv(P_sol) * N_sol;                 % Berechnung von L