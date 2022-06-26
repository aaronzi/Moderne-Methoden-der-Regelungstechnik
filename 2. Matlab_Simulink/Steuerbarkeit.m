% EINGABEN
% A             linearisierte Matrix A
% B             linearisierte Matrix B

% AUSGABEN
% Q             Steuerbarkeitsmatrix
% Det_Q         Determinante der Steuerbarkeitsmatrix

function [Q, Det_Q] = Steuerbarkeit(A, B)

% STEUERBARKEITSMATRIX
    Q  = [B];

    for i = 1:length(A)-1
        Q = horzcat(Q, A^(i)*B);
    end

    % Q = crtb(A, B);

% ÜBERPRÜFUNG DER STEUERBARKEIT
    Det_Q = vpa(det(Q), 7);        % Berechnung der Determinante
end