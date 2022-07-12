% EINGABEN
% A             Steuermatrix
% Q             Steuerbarkeitsmatrix
% Sp            Wunschpolstellen

% AUSGABEN
% k         Verstärkungsfaktoren in Vektorform

function [k] = Ackermann(A, B, Sp)
    % Polynomberechnung 
    syms s;
    Ps = (s-Sp(1));
    for i = 2:size(Sp, 2)
        Ps = Ps*(s-Sp(i));
    end
    Ps = expand(Ps);                % (s^n + alpha_n-1 * s^(n-1) + alpha_n-2 * s^(n-2) + ... + alpha_0)

    % Koeffizientenberechnung 
    Koeff = double(coeffs(Ps));     % Vektor [alpha_0, ... , alpha_n-2, alpha_n-1]

    % Inverse berechnen
    [Q] = Steuerbarkeit(A, B);
    inversQ = inv(Q);               % Inverse der Steuerbarkeitmatrix
    tn = inversQ(end, :);           % letzte Zeile der Steuerbarkeitsmatrix

    % Faktoren für k berechnen
    k = tn*Koeff(1)*eye(size(Q)); 
    for i = 2:size(Koeff, 2)
        k = k+(tn*Koeff(i)*A^(i-1));
    end
end