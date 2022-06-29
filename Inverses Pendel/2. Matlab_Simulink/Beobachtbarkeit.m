% EINGABEN
% A             linearisierte Matrix A
% B             linearisierte Matrix B

% AUSGABEN
% L             Steuerbarkeitsmatrix
% Det_Q         Determinante der Steuerbarkeitsmatrix

function [Q_obs, Det_Q_obs] = Beobachtbarkeit(A, C)

% STEUERBARKEITSMATRIX
    Q_obs  = [C];

    for i = 1:length(A)-1
        Q_obs = vertcat(Q_obs, C*A^(i));
    end

    % Q = crtb(A, B);

% ÜBERPRÜFUNG DER STEUERBARKEIT
    Det_Q_obs = vpa(det(Q_obs), 7);        % Berechnung der Determinante
end