% EINGABEN
% A             linearisierte Matrix A
% C             linearisierte Matrix C

% AUSGABEN
% L             Beobachtbarkeitsmatrix
% Rang_Q_obs    Rang der Beobachtbarkeitsmatrix

function [Q_obs] = Beobachtbarkeit(A, C)

% STEUERBARKEITSMATRIX
    Q_obs  = [C];

    for i = 1:length(A)-1
        Q_obs = vertcat(Q_obs, C*A^(i));
    end

% ÜBERPRÜFUNG DER BEOBACHTBARKEIT
    if (size(Q_obs, 1) == size(Q_obs, 2))
       fprintf("Determinante von Q_obs: %5.4f\n", vpa(det(Q), 7));

    elseif size(Q_obs, 1) ~= size(Q_obs, 2)
        fprintf("Rank von Q_obs: %i\n", rank(Q_obs));
    end
end