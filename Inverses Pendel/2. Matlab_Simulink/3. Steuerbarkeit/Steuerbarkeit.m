% EINGABEN
% A             linearisierte Matrix A
% B             linearisierte Matrix B

% AUSGABEN
% Q             Steuerbarkeitsmatrix
% Det_Q         Determinante der Steuerbarkeitsmatrix

function [Q] = Steuerbarkeit(A, B)

% STEUERBARKEITSMATRIX
    Q  = [B];

    for i = 1:length(A)-1
        Q = horzcat(Q, A^(i)*B);
    end

% ÜBERPRÜFUNG DER STEUERBARKEIT
    if (size(Q, 1) == size(Q, 2))
       fprintf("Determinante von Q: %5.4f\n", vpa(det(Q), 7));

    elseif size(Q, 1) ~= size(Q, 2)
        fprintf("Rank von Q: %i\n", rank(Q));
    end
end