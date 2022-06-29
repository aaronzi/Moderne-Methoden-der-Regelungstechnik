% EINGABEN
% A             linearisierte Matrix A
% C             linearisierte Matrix C

% AUSGABEN
% L             Beobachtbarkeitsmatrix
% Rang_Q_obs    Rang der Beobachtbarkeitsmatrix

function [Q_obs, Rang_Q_obs] = Beobachtbarkeit(A, C)

% STEUERBARKEITSMATRIX
    Q_obs  = [C];

    for i = 1:length(A)-1
        Q_obs = vertcat(Q_obs, C*A^(i));
    end

% ÜBERPRÜFUNG DER BEOBACHTBARKEIT
    Rang_Q_obs = vpa(rank(Q_obs), 7);   % Berechnung des Rangds

end